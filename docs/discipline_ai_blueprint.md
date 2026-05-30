# DISCIPLINE AI — Product, UX, AI, and Engineering Blueprint

## 1. Product Requirement Document (PRD)

### Mission
Help users become more disciplined every day through small consistent actions: hydration, movement, reflection, wake-up consistency, and focused habit execution.

### Product promise
DISCIPLINE AI is an intelligent accountability system that feels like a premium futuristic product made by Apple, Tesla, Nothing, Arc Browser, and OpenAI together: calm, dark, glassy, responsive, and deeply personal.

### Target users
- Students who need consistency across study, sleep, and health.
- Entrepreneurs and creators who need accountability without complexity.
- Professionals who want high-performance routines.
- Self-improvement users aged 16–40 who respond to streaks, progress, and AI feedback.

### North Star Metric
Weekly Disciplined Days: number of days per week where a user reaches a Discipline Score of 80+.

### Success metrics
- D1 retention: 45%+
- D7 retention: 25%+
- D30 retention: 12%+
- Average weekly completed habits: 18+
- Journal analysis opt-in conversion: 35%+
- Paid conversion: 4–8% of active users

### MVP scope
1. Authentication: email and Google Sign-In.
2. Premium onboarding and goal setup.
3. Dashboard with Discipline Score, water, exercise, journal, wake-up, streaks.
4. Water tracker with one-tap logging and reminders.
5. Simple exercise tracker for walking, pushups, stretching, running.
6. AI journal with summary, mood, goals, insights, next actions.
7. Streaks, XP, badges, missions.
8. AI coach chat.
9. Voice assistant command surface with “Hey Jarvis”.
10. Weekly analytics report.

### Non-goals for MVP
- Medical hydration or fitness diagnosis.
- Complex wearable integrations.
- Social network feed.
- Public leaderboards for minors.

## 2. Complete User Flow

### First-run flow
1. Splash: animated DISCIPLINE AI orb.
2. Welcome: value proposition and privacy promise.
3. Auth: Google, Apple-ready extension, or email.
4. Profile setup: name, age range, wake time, sleep target, discipline goal.
5. Baseline habits: water goal, exercise level, journal preference, wake routine.
6. AI coach calibration: preferred tone, reminder intensity, “why” statement.
7. Notification permission: framed as accountability moments.
8. Home dashboard.

### Daily flow
1. User opens app.
2. Dashboard shows score, next best action, active streak, XP opportunity.
3. User logs water, exercise, wake-up, habit completion.
4. User journals by text or voice.
5. AI summarizes journal and suggests one action.
6. User completes missions, earns XP, sees score rise.
7. End-of-day review confirms progress and sets tomorrow intent.

### Voice flow
1. User says “Hey Jarvis”.
2. Device wake-word layer starts assistant session.
3. Assistant listens and classifies command.
4. App executes tool: log water, start workout, open journal, check streak, show score.
5. Assistant responds naturally and updates UI.

## 3. Complete Feature Breakdown

### Discipline Dashboard
- 0–100 Discipline Score.
- Circular score ring with gradient motion.
- Water, exercise, journal, wake-up, habits, streak cards.
- AI “next best action”.
- Daily mission strip.

### Water Tracker
- Smart goal: defaults to 35 ml/kg/day if user provides weight, otherwise adaptive starter goal.
- One-tap logging: 250 ml, 500 ml, custom.
- Animated 3D water bottle.
- Reminder windows with quiet hours.
- Badges: First Liter, Hydration Lock, Seven-Day Flow.

### Exercise Tracker
- Activity types: walking, pushups, stretching, running.
- Timer, reps, distance/manual minutes.
- Starter plans: 5-minute reset, 10-minute walk, 30-day pushup ladder.
- Exercise streaks and recovery prompts.

### AI Journal
- Text and speech entry.
- AI summary, mood, goals, insights, next actions.
- “Pattern detected” weekly reflections.
- Private by default; user controls deletion.

### AI Discipline Coach
- Daily motivation.
- Habit coaching.
- Productivity advice.
- Weekly reviews.
- Accountability reminders.
- Tone: supportive, intelligent, practical.

### Voice Assistant
- Wake word: “Hey Jarvis”.
- Commands: log water, start workout, open journal, check streak, show score.
- Natural speech response.
- Tool execution through authenticated Cloud Functions.

## 4. Complete Database Structure

```text
users/{uid}
  profile
  preferences
  goals
  subscriptions/{subscriptionId}
  dailyLogs/{yyyy-mm-dd}
  waterLogs/{logId}
  exerciseLogs/{logId}
  journalEntries/{entryId}
  habits/{habitId}
  habitCompletions/{completionId}
  streaks/{streakId}
  missions/{missionId}
  badges/{badgeId}
  aiCoachMessages/{messageId}
  notifications/{notificationId}
  analyticsSnapshots/{periodId}
publicConfig/{configId}
```

## 5. Complete Firebase Schema

### users/{uid}
```json
{
  "displayName": "Roshan",
  "email": "user@example.com",
  "photoUrl": "https://...",
  "createdAt": "Timestamp",
  "timezone": "Asia/Kolkata",
  "ageRange": "18-24",
  "onboardingCompleted": true,
  "disciplineLevel": 7,
  "xp": 2450,
  "level": 8
}
```

### users/{uid}/goals/current
```json
{
  "waterMl": 2500,
  "exerciseMinutes": 30,
  "wakeTime": "06:00",
  "journalFrequency": "daily",
  "activeHabits": ["study", "walk", "deep_work"]
}
```

### users/{uid}/dailyLogs/{date}
```json
{
  "date": "2026-05-30",
  "waterMl": 1800,
  "exerciseMinutes": 18,
  "journalCompleted": true,
  "wakeUpCompleted": true,
  "habitCompletionRate": 0.8,
  "disciplineScore": 78,
  "xpEarned": 320,
  "updatedAt": "Timestamp"
}
```

### users/{uid}/journalEntries/{entryId}
```json
{
  "text": "Today I felt focused...",
  "source": "voice|text",
  "createdAt": "Timestamp",
  "mood": { "label": "focused", "confidence": 0.86 },
  "summary": "User felt focused and wants to maintain morning momentum.",
  "goals": ["Finish project", "Sleep before 11 PM"],
  "insights": ["Morning hydration correlates with better focus"],
  "nextActions": ["Plan top 3 tasks before checking messages"]
}
```

### Security
- Firestore rules enforce per-user ownership in `firebase/firestore.rules`.
- OpenAI API keys stay only in Cloud Functions, never in the mobile app.
- Journal entries support delete/export.
- Sensitive AI outputs should not be used for diagnosis.

## 6. Complete UI/UX Design System

### Visual principles
- Dark mode first.
- Glassmorphism cards over radial gradients.
- Neumorphic depth with soft shadows and inner highlights.
- 3D-like icons using layered gradients.
- Minimal text, high contrast, calm motion.

### Color tokens
- Obsidian: `#03040A`
- Graphite: `#080A12`
- Glass Surface: `rgba(255,255,255,0.08)`
- Electric Blue: `#233DFF`
- AI Violet: `#7C5CFF`
- Aqua: `#00F5D4`
- Flame: `#FF4E6A`
- Reward Gold: `#FFD166`

### Typography
- Primary: SF Pro Display on iOS, Inter/Roboto fallback on Android.
- Display: 48/800, tight tracking.
- Headline: 28/800.
- Body: 16/regular, 1.45 line height.
- Captions: 12–14, muted blue-gray.

### Motion
- Score ring: 700 ms ease-out.
- Card entrance: 280 ms staggered fade/slide.
- Fire streak: looping particle flame.
- Water bottle: liquid fill physics and subtle parallax.
- Voice assistant: waveform orb reacts to speech energy.

### Components
- GlassCard
- ScoreRing
- MetricCard
- MissionStrip
- AIInsightCard
- VoiceOrb
- ProgressBottle
- BadgeChip
- ReminderSheet
- JournalComposer

## 7. Complete Screen List

1. Splash
2. Welcome
3. Auth
4. Onboarding profile
5. Goal setup
6. AI coach calibration
7. Notification permission
8. Dashboard
9. Water tracker
10. Exercise tracker
11. Workout session timer
12. Journal list
13. Journal composer
14. Journal analysis result
15. AI coach chat
16. Voice assistant overlay
17. Habit builder
18. Streaks and rewards
19. Analytics weekly
20. Analytics monthly
21. Missions and challenges
22. Settings
23. Subscription paywall
24. Privacy and data controls

## 8. Flutter Project Structure

```text
lib/
  main.dart
  core/
    theme/
    widgets/
    routing/
    analytics/
    errors/
  features/
    auth/
    dashboard/
    water/
    exercise/
    journal/
    assistant/
    voice/
    scoring/
    streaks/
    gamification/
    analytics/
    settings/
```

Clean Architecture per feature:
```text
feature/
  data/        DTOs, Firebase data sources, repository implementations
  domain/      entities, repository contracts, use cases
  presentation/Riverpod providers, controllers, screens, widgets
```

## 9. API Architecture

### Mobile app
- Reads/writes user-owned data in Firestore.
- Calls Firebase Callable Functions for privileged AI work.
- Receives FCM notifications for reminders.

### Cloud Functions
- `analyzeJournalEntry`: sends journal text to OpenAI Responses API and returns structured JSON.
- `createRealtimeSession`: creates short-lived realtime credentials/session configuration for voice.
- `generateWeeklyReview`: summarizes weekly logs into insights.
- `scheduleSmartReminders`: calculates reminder timing based on completion patterns.
- `executeAssistantCommand`: validates assistant tool calls and writes Firestore updates.

### OpenAI integration
- Use the Responses API for journal analysis, coaching responses, structured outputs, and habit recommendations.
- Use Realtime API for low-latency speech-to-speech voice sessions; official docs recommend WebRTC for client/mobile-style realtime connections and note that Realtime supports speech-to-speech multimodal interactions.
- Use structured JSON schemas for predictable journal analysis and command classification.

Official references:
- Realtime API: https://platform.openai.com/docs/guides/realtime/
- Realtime WebRTC: https://platform.openai.com/docs/guides/realtime-webrtc
- Responses API: https://platform.openai.com/docs/api-reference/responses
- Structured Outputs: https://platform.openai.com/docs/guides/structured-outputs

## 10. Monetization Strategy

### Free
- Dashboard
- Water/exercise tracking
- Basic streaks
- 3 journal analyses/month
- Limited AI coach messages

### Pro monthly/yearly
- Unlimited AI journal analysis
- AI coach chat
- Advanced analytics
- Voice assistant
- Custom missions
- Premium themes and 3D icon packs
- Smart reminders

### Premium lifetime
- One-time purchase with fair-use AI limits.

### Expansion
- Student plan.
- Creator productivity templates.
- Team accountability circles after safety review.

## 11. User Retention Strategy

- Day 0: fast first win, log water, complete first mission.
- Day 1: “Your discipline baseline is ready.”
- Day 3: unlock first AI pattern.
- Day 7: weekly review with shareable visual.
- Day 14: streak protection token.
- Day 30: “identity milestone” celebration.
- Smart reminders based on missed routines, not generic spam.
- Emotional hooks: progress continuity, self-image, streak protection, coach memory.

## 12. Gamification System

### XP events
- Log water: +10 XP
- Complete water goal: +80 XP
- Exercise 10 minutes: +50 XP
- Complete workout plan: +120 XP
- Journal entry: +70 XP
- Wake-up routine: +60 XP
- 80+ Discipline Score: +150 XP

### Levels
- Level 1: Initiate
- Level 5: Builder
- Level 10: Operator
- Level 20: Elite
- Level 35: Unbreakable
- Level 50: Discipline Legend

### Missions
- Daily: Hydration Lock, Morning Activation, Journal Clarity.
- Weekly: 5 disciplined days, 3 workouts, 7 journals.
- Monthly: 20 high-score days, 100 km walking/running, 30-day wake streak.

### Streak protection
- One freeze per week for Pro users.
- Earned freeze for seven consecutive 80+ days.

## 13. AI Assistant Architecture

### Personality
Jarvis is concise, calm, premium, practical, and supportive. It avoids shame and focuses on the next controllable action.

### Context supplied to AI
- Today’s score and incomplete components.
- Last seven daily logs.
- Current goals and reminder preferences.
- Recent journal summaries, not raw journal text unless user asks.

### Tools
- `log_water(amountMl)`
- `start_workout(type)`
- `open_journal()`
- `get_streak()`
- `get_today_score()`
- `create_mission(type)`
- `schedule_reminder(time, reason)`

### Guardrails
- No medical diagnosis.
- No extreme fitness advice.
- Crisis language routes to safety resources.
- Minors receive conservative coaching and no public competition features.

## 14. Voice Assistant Architecture

### Wake word layer
- On-device wake-word engine listens for “Hey Jarvis”.
- After wake, app opens a secure assistant session.
- User can disable always-listening and use push-to-talk.

### Realtime path
1. App requests ephemeral session from Firebase Function.
2. App establishes WebRTC connection with OpenAI Realtime API.
3. Audio streams directly to session.
4. AI calls tools for app actions.
5. App confirms action and speaks response.

### Fallback chained path
1. Speech-to-text.
2. Command classification through Cloud Function.
3. Firestore/action execution.
4. Text-to-speech response.

## 15. Launch Roadmap

### Phase 0 — Brand and prototype, 2 weeks
- Final visual system.
- Clickable Figma prototype.
- Flutter dashboard prototype.

### Phase 1 — MVP, 8 weeks
- Auth, Firestore, dashboard.
- Water/exercise/journal.
- Score, streaks, XP.
- AI journal analysis.
- Basic AI coach.

### Phase 2 — Beta, 4 weeks
- Voice assistant beta.
- Weekly reports.
- Paywall.
- Push reminders.
- Performance polish.

### Phase 3 — Public launch, 2 weeks
- App Store/Play Store assets.
- Analytics, crash reporting.
- Creator launch campaign.
- Product Hunt and self-improvement communities.

### Phase 4 — Growth, ongoing
- Wearables.
- Advanced routines.
- Coach memory.
- Team accountability.
- Localization.

## 16. App Store Description

**DISCIPLINE AI — Build discipline with an intelligent daily coach.**

Transform small daily actions into unstoppable momentum. Track water, exercise, journaling, wake-up routines, habits, streaks, XP, and your Daily Discipline Score in a beautiful futuristic dashboard.

Use the AI Journal to summarize your thoughts, detect mood, extract goals, and suggest practical next actions. Ask Jarvis, your intelligent discipline coach, to log water, start workouts, check streaks, and help you stay accountable.

DISCIPLINE AI is designed for students, creators, entrepreneurs, professionals, and anyone ready to become more consistent.

## 17. Play Store Description

DISCIPLINE AI is your premium AI accountability coach for building better habits every day. Track hydration, workouts, journals, wake-up routines, streaks, XP, missions, and your 0–100 Daily Discipline Score.

Features:
- Smart water tracker
- Simple exercise tracking
- AI journal analysis
- AI discipline coach
- Voice assistant commands
- Streaks, XP, levels, badges, and challenges
- Weekly and monthly analytics
- Futuristic dark-mode dashboard

Build discipline through small consistent wins.

## 18. Full Development Plan

### Sprint 1: Foundation
- Flutter project setup.
- Theme, routing, Riverpod shell.
- Firebase Auth and Firestore rules.
- Dashboard static UI.

### Sprint 2: Tracking core
- Water logging.
- Exercise logging.
- Daily logs.
- Score calculation.

### Sprint 3: Journal and AI
- Journal CRUD.
- Speech journal input.
- Cloud Function journal analysis.
- Journal analysis UI.

### Sprint 4: Gamification
- XP engine.
- Levels.
- Streaks.
- Badges.
- Missions.

### Sprint 5: AI coach
- Coach chat.
- Context builder.
- Smart next action.
- Weekly review generation.

### Sprint 6: Voice assistant
- Wake-word/push-to-talk.
- Realtime session function.
- Command tools.
- Voice overlay UI.

### Sprint 7: Monetization and retention
- Paywall.
- Subscription entitlement model.
- FCM reminders.
- Streak protection.

### Sprint 8: Launch hardening
- Offline cache.
- Accessibility.
- Security review.
- Performance profiling.
- Store screenshots and listings.
