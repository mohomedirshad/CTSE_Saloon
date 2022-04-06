// import 'package:flutter/material.dart';
// import 'package:salon_app/constants.dart';
// import 'package:salon_app/screens/Forms/make_appointment.dart';

// import 'image_and_icons.dart';
// import 'title_and_price.dart';

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           ImageAndIcons(size: size),
//           TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
//           SizedBox(height: kDefaultPadding),
//           Row(
//             children: <Widget>[
//               SizedBox(
//                 width: size.width / 2,
//                 height: 84,
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   color: kPrimaryColor,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MakeAppointment(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Book Now",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: FlatButton(
//                   onPressed: () {},
//                   child: Text("Description"),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
