class JournalAnalysis {
  const JournalAnalysis({
    required this.summary,
    required this.mood,
    required this.goals,
    required this.insights,
    required this.nextActions,
  });

  final String summary;
  final String mood;
  final List<String> goals;
  final List<String> insights;
  final List<String> nextActions;
}
