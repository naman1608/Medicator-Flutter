class Medicine {
  String productId;
  String name;
  String manufacturing;
  String expiry;
  String mrp;
  Medicine(
      {required this.productId,
      required this.name,
      required this.manufacturing,
      required this.expiry,
      required this.mrp});

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'name': name,
        'manufacturing': manufacturing,
        'expiry': expiry,
        'mrp': mrp,
      };

  factory Medicine.fromJson(Map<String, dynamic> json) {
    Medicine medicine = Medicine(
        productId: json["productId"],
        name: json["name"],
        manufacturing: json["manufacturing"],
        expiry: json["expiry"],
        mrp: json["mrp"]);
    return medicine;
  }
}
