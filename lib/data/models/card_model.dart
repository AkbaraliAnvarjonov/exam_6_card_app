class CardModel {
  String cardName;
  String cardNumber;
  List<dynamic> gradient;
  int moneyAmount;
  String owner;
  String expireDate;
  String iconImage;

  CardModel({
    required this.cardName,
    required this.cardNumber,
    required this.owner,
    required this.expireDate,
    required this.moneyAmount,
    required this.gradient,
    required this.iconImage,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        cardName: json['card_name'] as String? ?? "",
        cardNumber: json['card_number'] as String? ?? "",
        owner: json['owner'] as String? ?? "",
        expireDate: json['expire_date'] as String? ?? "",
        moneyAmount: json['money_amount'] as int? ?? 0,
        gradient: json['gradient'] as List<dynamic>? ?? [],
        iconImage: json['icon_image'] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'card_name': cardName,
      'card_number': cardNumber,
      'icon_image': iconImage,
      'owner': owner,
      'money_amount': moneyAmount,
      'gradient': gradient,
      'expire_date': expireDate,
    };
  }

  CardModel copyWith({
    String? cardName,
    String? cardNumber,
    List<dynamic>? gradient,
    int? moneyAmount,
    String? owner,
    String? expireDate,
    String? iconImage,
    required id,
  }) {
    return CardModel(
      cardName: cardName ?? "",
      cardNumber: cardNumber ?? "",
      owner: owner ?? "",
      expireDate: expireDate ?? "",
      moneyAmount: moneyAmount ?? 0,
      gradient: gradient ?? [],
      iconImage: iconImage ?? "",
    );
  }
}
