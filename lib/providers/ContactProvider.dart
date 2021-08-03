import 'package:contact_app/db/DbSQLiteHelper.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/foundation.dart';

class ContactProvider with ChangeNotifier{
  List<Contact> _contactList = [];
  List<Contact> get contacts => _contactList;

  Future<int> addContact(Contact contact) async{
    return DbSQLiteHelper.addContact(contact);
  }

  void getContacts() async{
    _contactList = await DbSQLiteHelper.getAllContact();
    notifyListeners();
  }

}