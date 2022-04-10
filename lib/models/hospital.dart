class Hospital {
  String name;
  String email;
  String address;
  Hospital({required this.name, required this.email, required this.address});

  factory Hospital.createCompany({
    required String email,
    required String name,
    required String address,
  }) {
    Hospital hospital = Hospital(
      email: email,
      name: name,
      address: address,
    );
    return hospital;
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'address': address,
      };
      
}
