import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/glass_card.dart';
import '../../scoring/domain/discipline_score.dart';

final disciplineScoreProvider = Provider<DisciplineScore>((ref) {
  return const DisciplineScore(
    waterCompletion: 0.72,
    exerciseCompletion: 0.60,
    journalCompletion: 1,
    wakeUpCompletion: 1,
    habitCompletion: 0.80,
  );
});

class DisciplineDashboardScreen extends ConsumerWidget {
  const DisciplineDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(disciplineScoreProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          children: [
            const _Header(),
            const SizedBox(height: 24),
            _HeroScoreCard(score: score.value),
            const SizedBox(height: 18),
            const _MetricGrid(),
            const SizedBox(height: 18),
            const _AiCoachCard(),
            const SizedBox(height: 18),
            const _MissionStrip(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.graphic_eq_rounded),
        label: const Text('Hey Jarvis'),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DISCIPLINE AI', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 6),
              Text('Your intelligent accountability system', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(colors: [Color(0xFF00F5D4), Color(0xFF7C5CFF)]),
            boxShadow: [BoxShadow(color: const Color(0xFF00F5D4).withOpacity(0.35), blurRadius: 24)],
          ),
          child: const Icon(Icons.auto_awesome_rounded, color: Colors.black),
        ),
      ],
    );
  }
}

class _HeroScoreCard extends StatelessWidget {
  const _HeroScoreCard({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(26),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Discipline Score', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
                Text('$score', style: Theme.of(context).textTheme.displayLarge),
                Text('Elite momentum. Keep the chain alive.', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          SizedBox(width: 132, height: 132, child: _ScoreRing(progress: score / 100)),
        ],
      ),
    );
  }
}

class _ScoreRing extends StatelessWidget {
  const _ScoreRing({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScoreRingPainter(progress),
      child: Center(
        child: Text('${(progress * 100).round()}%', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}

class _ScoreRingPainter extends CustomPainter {
  _ScoreRingPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect.deflate(12), -math.pi / 2, math.pi * 2, false, stroke..color = Colors.white.withOpacity(0.10));
    canvas.drawArc(
      rect.deflate(12),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      stroke
        ..shader = const SweepGradient(colors: [Color(0xFF00F5D4), Color(0xFF7C5CFF), Color(0xFFFF4ECD)]).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) => oldDelegate.progress != progress;
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid();

  @override
  Widget build(BuildContext context) {
    final metrics = [
      ('Water', '1.8 / 2.5 L', Icons.water_drop_rounded, const Color(0xFF00D9FF)),
      ('Exercise', '18 / 30 min', Icons.directions_run_rounded, const Color(0xFFFFB86B)),
      ('Journal', 'Complete', Icons.edit_note_rounded, const Color(0xFFBFA7FF)),
      ('Streak', '14 days', Icons.local_fire_department_rounded, const Color(0xFFFF4E6A)),
    ];

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.18,
      children: [
        for (final metric in metrics)
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(metric.$3, color: metric.$4, size: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(metric.$1, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(metric.$2, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _AiCoachCard extends StatelessWidget {
  const _AiCoachCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.psychology_alt_rounded, color: Color(0xFF00F5D4)),
              const SizedBox(width: 10),
              Text('AI Coach Insight', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'You perform best when water and movement happen before noon. Start a 10-minute walk now to unlock today’s Momentum badge.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _MissionStrip extends StatelessWidget {
  const _MissionStrip();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          const Icon(Icons.military_tech_rounded, color: Color(0xFFFFD166), size: 36),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mission: Hydration Lock', style: Theme.of(context).textTheme.titleLarge),
                Text('+120 XP if you complete water goal by 8 PM', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
