import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/discipline_theme.dart';
import 'features/dashboard/presentation/discipline_dashboard_screen.dart';

void main() {
  runApp(const ProviderScope(child: DisciplineAiApp()));
}

class DisciplineAiApp extends StatelessWidget {
  const DisciplineAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DISCIPLINE AI',
      debugShowCheckedModeBanner: false,
      theme: DisciplineTheme.dark(),
      home: const DisciplineDashboardScreen(),
      builder: (context, child) => _AmbientShell(child: child ?? const SizedBox()),
    );
  }
}

class _AmbientShell extends StatelessWidget {
  const _AmbientShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.7, -0.95),
          radius: 1.4,
          colors: [Color(0xFF233DFF), Color(0xFF080A12), Color(0xFF03040A)],
          stops: [0, 0.44, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -70,
            child: Transform.rotate(
              angle: math.pi / 6,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.cyanAccent.withOpacity(0.28), Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
