class CardModel {
  String cardName;
  String cardNumber;
  int gradientA;
  int gradientB;
  int moneyAmount;
  String owner;
  String expireDate;
  String iconImage;
  int? id;

  CardModel({
    this.id,
    required this.cardName,
    required this.cardNumber,
    required this.owner,
    required this.expireDate,
    required this.moneyAmount,
    required this.gradientA,
    required this.gradientB,
    required this.iconImage,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json["id"] as int? ?? 0,
      cardName: json['cardName'] as String? ?? "",
      cardNumber: json['cardNumber'] as String? ?? "",
      owner: json['owner'] as String? ?? "",
      expireDate: json['expireDate'] as String? ?? "",
      moneyAmount: json['moneyAmount'] as int? ?? 0,
      gradientA: json['gradientA'] as int? ?? 0,
      gradientB: json['gradientB'] as int? ?? 0,
      iconImage: json['iconImage'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardName': cardName,
      'cardNumber': cardNumber,
      'iconImage': iconImage,
      'owner': owner,
      'moneyAmount': moneyAmount,
      'gradientA': gradientA,
      'gradientB': gradientB,
      'expireDate': expireDate,
    };
  }

  CardModel copyWith({
    String? cardName,
    String? cardNumber,
    int? gradientA,
    int? gradientB,
    int? moneyAmount,
    String? owner,
    String? expireDate,
    String? iconImage,
    required id,
  }) {
    return CardModel(
      id: id ?? 0,
      cardName: cardName ?? "",
      cardNumber: cardNumber ?? "",
      owner: owner ?? "",
      expireDate: expireDate ?? "",
      moneyAmount: moneyAmount ?? 0,
      gradientA: gradientA ?? 0,
      gradientB: gradientB ?? 0,
      iconImage: iconImage ?? "",
    );
  }
}
