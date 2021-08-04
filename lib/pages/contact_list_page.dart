import 'package:contact_app/custom_widget/conact_item.dart';
//import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/contact_details_page.dart';
import 'package:contact_app/providers/ContactProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_contact_page.dart';

class ContactListPage extends StatefulWidget {
  static final String routeName = '/contact_list';

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  //final provider = ContactProvider();
  //late Contact contact;
  late ContactProvider _provider;

  @override
  void initState() {
    ContactProvider();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    print("didChangeDependencies call");
    _provider = Provider.of<ContactProvider>(context, listen:false);
    //Future.delayed(
    // const Duration(seconds: 5),
    // (){
    //  _provider.getContacts();
    //});
    _loadData();
    super.didChangeDependencies();
  }

  _loadData(){
    _provider.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    //_provider.getContacts();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Contacts'),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.contacts.length,
          itemBuilder: (context, index) {
            final contact = provider.contacts[index];
            return ContactItem(contact);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
          //Navigator.push(
          //  context,
          //  MaterialPageRoute(
          //      builder: (context)=>NewContactPage(),
          //  )
          //),
          Navigator.pushNamed( context, NewContactPage.routeName).then((_) {
            //print('Back');
            _loadData();
          }),

        child: Icon(Icons.add),
      ),
    );
  }
}
