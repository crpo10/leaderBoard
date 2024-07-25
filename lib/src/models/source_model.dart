class SourceModelStatic {
  final String id;
  final String fullName;
  final String month;
  final String week1;
  final String week2;
  final String week3;
  final String week4;

  SourceModelStatic({
    required this.id,
    required this.fullName,
    required this.month,
    required this.week1,
    required this.week2,
    required this.week3,
    required this.week4,
  });

  static fromJson(json) {}
}
