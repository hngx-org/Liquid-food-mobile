class LunchInfo {
  final String fullName;
  final int lunchReceived;
  final String role;
  final String category;
  final String image;
  // final

  LunchInfo(
      {required this.fullName,
      required this.lunchReceived,
      required this.role,
      required this.category,
      required this.image});

  LunchInfo copyWith(
      {String? fullName,
      int? lunchReceived,
      String? role,
      String? when,
      String? image}) {
    return LunchInfo(
      fullName: fullName ?? this.fullName,
      lunchReceived: lunchReceived ?? this.lunchReceived,
      role: role ?? this.role,
      category: when ?? category,
      image: image ?? this.image,
    );
  }
}
