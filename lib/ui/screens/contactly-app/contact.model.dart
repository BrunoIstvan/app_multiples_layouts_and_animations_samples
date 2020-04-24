class ContactModel {
  String name;
  String address;
  String contact;
  String photo;
  String url;

  ContactModel({
    this.name,
    this.address,
    this.contact,
    this.photo,
    this.url,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return new ContactModel(
      name: json['name'],
      address: json['address'],
      contact: json['contact'],
      photo: json['photo'],
      url: json['url'],
    );
  }
}
