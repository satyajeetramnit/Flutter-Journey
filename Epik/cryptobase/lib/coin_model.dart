class Coin {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercent;

  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  factory Coin.fromJSON(Map<String, dynamic> json) {
    return Coin(
      name: json["name"],
      symbol: json["symbol"],
      imageUrl: json["imageUrl"],
      price: json["current_price"],
      change: json["price_change_24h"],
      changePercent: json["price_change_percentage_24h"],
    );
  }
}

List<Coin> coinList = [];
