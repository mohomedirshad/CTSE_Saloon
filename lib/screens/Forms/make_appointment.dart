// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:salon_app/components/my_bottom_nav_bar.dart';
// import 'package:salon_app/screens/details/components/header.dart';

// class MakeAppointment extends StatefulWidget {
//   @override
//   _FormTestState createState() => _FormTestState();
// }

// class _FormTestState extends State<MakeAppointment> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   var nameController = new TextEditingController();
//   var addressController = new TextEditingController();
//   var ageController = new TextEditingController();

//   final databaseRef = FirebaseDatabase.instance.reference();
//   String _name;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HeaderWithSearchBox(size: size),
//             Form(
//               key: _formKey,
//               child: Container(
//                 margin: const EdgeInsets.all(24.0),
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       "Book Now",
//                       style: TextStyle(fontSize: 28),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                           labelText: 'Name', border: OutlineInputBorder()),
//                       validator: (text) {
//                         if (text.isEmpty) {
//                           return 'Name cannot be empty';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: addressController,
//                       decoration: InputDecoration(
//                           labelText: 'Address', border: OutlineInputBorder()),
//                       validator: (text) {
//                         if (text.isEmpty) {
//                           return 'Address cannot be empty';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: ageController,
//                       decoration: InputDecoration(
//                           labelText: 'Age', border: OutlineInputBorder()),
//                       validator: (text) {
//                         if (text.isEmpty) {
//                           return 'Age cannot be empty';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Container(
//                       child: ElevatedButton(
//                         child: Text('Make Appointment'),
//                         onPressed: () {
//                           if (_formKey.currentState.validate()) {
//                             _formKey.currentState.save();
//                             print(_name);
//                           }
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// void insertData(String name, String address, String age) {
//   var databaseRef;
//   databaseRef.child("path").set({});
// }
