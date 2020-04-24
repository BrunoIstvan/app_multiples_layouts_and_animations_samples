import 'dart:convert';

import 'package:app_multiple_layouts_and_animations/ui/screens/contactly-app/contac-list.model.dart';
import 'package:flutter/services.dart' show rootBundle;

class ContactlyService {
  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('assets/data/records.json');
  }

  Future<ContactModelList> loadRecords() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    ContactModelList records = new ContactModelList.fromJson(jsonResponse);
    return records;
  }
}
