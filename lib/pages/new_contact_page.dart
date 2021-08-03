import 'package:contact_app/custom_widget/form_field_widgets.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/contact_details_page.dart';
import 'package:contact_app/providers/ContactProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {
  //const NewContactPage({Key? key}) : super(key: key);
  static final String routeName = '/new_contact';

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  String email = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    //final contactPlaceHolder = ModalRoute.of(context)!.settings.arguments as Contact;
    //print(contactPlaceHolder.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
        actions: [
          IconButton(
              onPressed: _saveContact,
              icon: Icon(Icons.save)
          )
        ],
      ),
      body:Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            //nameFieldWidget(context, name, contactPlaceHolder.name),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Name',
                icon: Icon(Icons.person),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please provide a valid name';
                }
                if (value.length > 20) {
                  return 'Name should not exceed 20 chars';
                }
                return null;
              },
              onSaved: (value) {
                name = value!;
              },
            ),
            const SizedBox(height: 8,),
            //phoneFieldWidget(context, phone, contactPlaceHolder.phone),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                icon: Icon(Icons.phone),
              ),
              textInputAction: TextInputAction.next,
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please provide a valid phone number';
                }
                if(value.length > 11){
                  return 'Phone no should not exceed 11 chars';
                }
                return null;
              },
              onSaved: (value){
                phone = value!;
              },
            ),
            const SizedBox(height: 8,),
            //emailFieldWidget(context, email, contactPlaceHolder.email),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Email Address',
                icon: Icon(Icons.email),
              ),
              textInputAction: TextInputAction.next,
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please provide a valid email address';
                }
                return null;
              },
              onSaved: (value){
                email = value!;
              },
            ),
            const SizedBox(height: 8,),
            //addressFieldWidget(context, address, contactPlaceHolder.address),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Address',
                icon: Icon(Icons.location_city),
              ),
              textInputAction: TextInputAction.done,
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please provide a valid address';
                }
                return null;
              },
              onSaved: (value){
                address = value!;
              },
            ),
            const SizedBox(height: 15,),
            //Center(
            //  child: ElevatedButton(
            //      onPressed: (){},
            //      child: Text('Save')
            //  ),
            //),
          ],
        ),
      ),
    );
  }

  void _saveContact() {
    if(_formKey.currentState!.validate()){
      //save data to database
      _formKey.currentState!.save();

      final contact = Contact(name: name, phone: phone, email: email, address: address);
      print(contact);

      Provider.of<ContactProvider>(context, listen:false).addContact(contact)
          .then((_) => Navigator.pop(context));

      //final provider = ContactProvider();
      //provider.addContact(contact);
    }
  }
}
