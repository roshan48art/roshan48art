class DisciplineScore {
  const DisciplineScore({
    required this.waterCompletion,
    required this.exerciseCompletion,
    required this.journalCompletion,
    required this.wakeUpCompletion,
    required this.habitCompletion,
  });

  final double waterCompletion;
  final double exerciseCompletion;
  final double journalCompletion;
  final double wakeUpCompletion;
  final double habitCompletion;

  int get value {
    final score = waterCompletion * 25 +
        exerciseCompletion * 25 +
        journalCompletion * 20 +
        wakeUpCompletion * 15 +
        habitCompletion * 15;
    return score.round().clamp(0, 100);
  }
}
