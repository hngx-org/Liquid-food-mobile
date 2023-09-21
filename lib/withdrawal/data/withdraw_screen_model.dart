class WithdrawalModel {
  final String availableLunch;
  final String availableAmount;
  final String worth;
  final String perLunch;

  const WithdrawalModel({
    required this.availableLunch,
    required this.availableAmount,
    required this.worth,
    required this.perLunch,
  });

  WithdrawalModel copyWith({
    final String? availableLunch,
    final String? availableAmount,
    final String? worth,
    final String? perLunch,
  }) {
    return WithdrawalModel(
      availableAmount: availableAmount ?? this.availableAmount,
      availableLunch: availableLunch ?? this.perLunch,
      worth: worth ?? this.worth,
      perLunch: perLunch ?? this.perLunch,
    );
  }
}
