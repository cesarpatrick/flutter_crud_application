class Cases {
  final String? id;
  final String? name;
  final String? gender;
  final String? age;
  final String? address;
  final String? city;
  final String? country;
  final String? status;
  final String? updated;

  Cases(
      {this.id,
      this.name,
      this.gender,
      this.status,
      this.age,
      this.address,
      this.city,
      this.country,
      this.updated});

  Cases.fromMap(Map<String, dynamic> res)
      : id = res['id'].toString(),
        name = res['name'],
        gender = res['gender'],
        status = res['status'],
        age = res['age'],
        address = res['address'],
        city = res['city'],
        country = res['country'],
        updated = res['updated'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'status': status,
      'age': age,
      'address': address,
      'city': city,
      'country': country,
      'updated': updated
    };
  }
}
