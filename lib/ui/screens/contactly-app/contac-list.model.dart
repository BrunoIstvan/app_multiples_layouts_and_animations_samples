import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contact.model.dart';

class ContactModelList {
  List<ContactModel> records = new List();

  ContactModelList({this.records});

  factory ContactModelList.fromJson(List<dynamic> parsedJson) {
    List<ContactModel> records = new List<ContactModel>();

    records = parsedJson.map((i) => ContactModel.fromJson(i)).toList();

    return new ContactModelList(
      records: records,
    );
  }
}
