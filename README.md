# DISCIPLINE AI

DISCIPLINE AI is a premium Flutter product blueprint and starter implementation for a futuristic self-discipline app focused on water intake, exercise, AI journaling, wake-up routines, streaks, gamification, and an intelligent voice assistant.

The repository contains:

- A complete product and technical blueprint in [`docs/discipline_ai_blueprint.md`](docs/discipline_ai_blueprint.md).
- A Flutter clean-architecture starter app with a premium dark dashboard UI.
- Firebase rules/indexes and Cloud Functions API contracts for OpenAI-backed journal analysis, coaching, and voice assistant command handling.

## Quick start

```bash
flutter pub get
flutter run
```

> Flutter is not installed in this execution environment, so validation here is limited to static file checks.

## Product vision

Help users become more disciplined every day through small consistent actions, AI accountability, motivating streaks, and beautiful progress visualization.

## Architecture snapshot

- **Frontend:** Flutter + Riverpod
- **Backend:** Firebase Auth, Firestore, Cloud Functions, FCM
- **AI:** OpenAI Responses API for journal/coaching JSON workflows; OpenAI Realtime API for low-latency natural voice assistant sessions
- **Voice:** Wake-word detection on device, Realtime/WebRTC for live assistant, fallback chained STT → LLM → TTS path
- **Pattern:** Clean Architecture with feature modules, repositories, use cases, immutable domain models
