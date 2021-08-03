
import 'package:flutter/material.dart';

Widget nameFieldWidget (BuildContext context, String name, String namePlace) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Enter Name',
      hintText: namePlace,
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
  );
}

Widget phoneFieldWidget (BuildContext context, String phone, String phonePlace) {
  return TextFormField(
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      labelText: 'Enter Phone Number',
      hintText: phonePlace,
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
  );
}

Widget emailFieldWidget (BuildContext context, String email, String emailPlace) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Enter Email Address',
      hintText: emailPlace,
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
  );
}

Widget addressFieldWidget(BuildContext context, String address, String addressPlace) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Enter Address',
      hintText: addressPlace,
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
  );
}