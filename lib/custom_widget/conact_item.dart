import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/contact_details_page.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  ContactItem(this.contact);

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    //return Card(
    //  child: Padding(
    //    padding: const EdgeInsets.all(8.0),
    //    child: ListTile(
    //      onTap: () => Navigator.pushNamed(context, ContactDetailsPage.routeName, arguments: widget.contact.id),
    //      title: Text(widget.contact.name),
    //      subtitle: Text(widget.contact.phone),
    //    ),
    //  ),
    //);
    return Material(
      //elevation: 4.0,
      //borderRadius: BorderRadius.circular(5.0),
      color: Colors.black54,
      child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, ContactDetailsPage.routeName, arguments: widget.contact.id),
          //   child: Card(
        //     child: Padding(
        //       padding: const EdgeInsets.all(3.0),
        //       child: Container(
        //         //padding: EdgeInsets.only(left: 6,right: 6,top: 10,bottom: 10),
        //         child: Row(
        //           children: <Widget>[
        //             Expanded(
        //               child: Container(
        //                 color: Colors.transparent,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Align (
        //                       child:  Text(widget.contact.name, style: TextStyle(fontSize: 40.0),), //so big text
        //                       alignment: FractionalOffset.topLeft,
        //                     ),
        //                     Divider(color: Colors.blue,),
        //                     Align (
        //                         child:  Text("Address : ${widget.contact.address}"),
        //                         alignment: FractionalOffset.topLeft,
        //                     ),
        //                     Divider(color: Colors.blue,),
        //                     Align (
        //                         child:  Text("More stuff ${widget.contact.phone}"),
        //                         alignment: FractionalOffset.topLeft,
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.end,
        //                       children: <Widget>[ //add some actions, icons...etc
        //                         TextButton(onPressed: () {}, child:  Text("EDIT")),
        //                         TextButton(
        //                           onPressed: () {},
        //                           child:  Text("DELETE", style:  TextStyle(color: Colors.redAccent))
        //                         )
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             CircleAvatar(
        //               backgroundImage: NetworkImage(''),
        //               maxRadius: 30,
        //             ),
        //             SizedBox(width: 16,),
        //           ]
        //         ),
        //       ),
        //     ),
        // ),
          child: Card(
            color: Colors.grey[300],
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50, //we give the image a radius of 50
                        backgroundImage: AssetImage('images/male-clipart-professional-man-3.jpg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //CrossAxisAlignment.end ensures the components are aligned from the right to left.
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 150,
                            color: Colors.black54,
                            height: 2,
                          ),
                          const SizedBox(height: 4),
                          Text(widget.contact.phone),
                          Text(widget.contact.address),
                          const SizedBox(height: 15),
                          IconButton(
                              onPressed: (){},
                              icon: (widget.contact.favorite)?Icon(Icons.favorite):Icon(Icons.favorite_border)
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.contact.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          SizedBox(height: 4),
                          Text(widget.contact.name),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Mobile App Developer',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text('FlutterStars Inc'),
                        ],
                      ),
                    ]
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
          ),
      ),
    );
  }
}


