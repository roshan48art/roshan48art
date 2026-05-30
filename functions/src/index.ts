import { onCall, HttpsError } from 'firebase-functions/v2/https';
import OpenAI from 'openai';
import { z } from 'zod';

const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

const journalRequestSchema = z.object({
  entryId: z.string().min(1),
  text: z.string().min(20).max(12000),
  locale: z.string().default('en-US'),
});

export const analyzeJournalEntry = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError('unauthenticated', 'Sign in before requesting journal analysis.');
  }

  const input = journalRequestSchema.parse(request.data);
  const response = await openai.responses.create({
    model: 'gpt-5.4-mini',
    input: [
      {
        role: 'system',
        content:
          'You are DISCIPLINE AI, a supportive practical coach. Return concise JSON with summary, mood, goals, insights, and nextActions.',
      },
      { role: 'user', content: input.text },
    ],
    text: {
      format: {
        type: 'json_schema',
        name: 'journal_analysis',
        schema: {
          type: 'object',
          additionalProperties: false,
          required: ['summary', 'mood', 'goals', 'insights', 'nextActions'],
          properties: {
            summary: { type: 'string' },
            mood: {
              type: 'object',
              additionalProperties: false,
              required: ['label', 'confidence'],
              properties: {
                label: { type: 'string' },
                confidence: { type: 'number' },
              },
            },
            goals: { type: 'array', items: { type: 'string' } },
            insights: { type: 'array', items: { type: 'string' } },
            nextActions: { type: 'array', items: { type: 'string' } },
          },
        },
      },
    },
  });

  return { entryId: input.entryId, analysis: response.output_text };
});

export const createRealtimeSession = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError('unauthenticated', 'Sign in before starting voice coaching.');
  }

  const session = await openai.beta.realtime.sessions.create({
    model: 'gpt-realtime',
    voice: 'marin',
    instructions:
      'You are Jarvis inside DISCIPLINE AI. Be concise, premium, supportive, and action-oriented. Use tools for logging water, workouts, journal navigation, streak checks, and score lookup.',
  });

  return session;
});
