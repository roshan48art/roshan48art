enum AssistantCommandType {
  logWater,
  startWorkout,
  openJournal,
  checkStreak,
  showTodayScore,
  unknown,
}

class AssistantCommand {
  const AssistantCommand({required this.type, required this.spokenText, this.amountMl});

  final AssistantCommandType type;
  final String spokenText;
  final int? amountMl;
}
