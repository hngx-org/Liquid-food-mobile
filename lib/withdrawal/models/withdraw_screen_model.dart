class WithdrawalModel {
  final String availableAmount;
  final String worth;
  final String perLunch;

  const WithdrawalModel({
    required this.availableAmount,
    required this.worth,
    required this.perLunch,
  });

  WithdrawalModel copyWith({
    final String? availableAmount,
    final String? worth,
    final String? perLunch,
  }) {
    return WithdrawalModel(
      availableAmount: availableAmount ?? this.availableAmount,
      worth: worth ?? this.worth,
      perLunch: perLunch ?? this.perLunch,
    );
  }
}
