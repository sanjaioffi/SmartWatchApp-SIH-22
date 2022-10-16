class Medicine {
  final String medicineName;
  final bool morning;
  final bool afternoon;
  final bool night;

  const Medicine({
    required this.medicineName,
    required this.morning,
    required this.afternoon,
    required this.night,
  });

  Medicine copy({
    String? medicineName,
    bool? morning,
    bool? afternoon,
    bool? night
  }) =>
      Medicine(
        medicineName: medicineName ?? this.medicineName,
        morning: morning ?? this.morning,
        afternoon: afternoon ?? this.afternoon,
        night: morning ?? this.night,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Medicine &&
          runtimeType == other.runtimeType &&
          medicineName == other.medicineName &&
          morning == other.morning &&
          afternoon == other.afternoon &&
          night == other.night ;

  @override
  int get hashCode => medicineName.hashCode ^ morning.hashCode ^ afternoon.hashCode ^ night.hashCode;
}
