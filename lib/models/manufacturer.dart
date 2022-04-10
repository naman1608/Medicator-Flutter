class Manufacturer {
  String name;
  String email;
  String address;
  Manufacturer(
      {required this.name, required this.email, required this.address});

  factory Manufacturer.createManufacturer({
    required String email,
    required String name,
    required String address,
  }) {
    Manufacturer manufacturer = Manufacturer(
      email: email,
      name: name,
      address: address,
    );
    return manufacturer;
  }
}
