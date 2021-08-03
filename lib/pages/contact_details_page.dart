import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  //const ContactDetailsPage({Key? key}) : super(key: key);
  static final String routeName = '/contact_details';

  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  int id = -1;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details Page'),
      ),
      body: Text('$id'),
    );
  }
}
