// import 'package:flutter/material.dart';
// import 'package:salon_app/components/my_bottom_nav_bar.dart';
// import 'package:salon_app/constants.dart';
// import 'package:salon_app/screens/Forms/make_appointment.dart';
// import 'package:salon_app/screens/details/components/title_and_price.dart';

// class Hair extends StatelessWidget {
//   const Hair({
//     Key key,
//     @required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: buildAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(
//                   bottom: kDefaultPadding * 3, top: kDefaultPadding * 1),
//               child: SizedBox(
//                 height: size.height * 0.6,
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       height: size.height * 1,
//                       width: size.width * 1,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(63),
//                             bottomLeft: Radius.circular(63),
//                             topRight: Radius.circular(63),
//                             bottomRight: Radius.circular(63)),
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 60,
//                             color: kPrimaryColor.withOpacity(0.29),
//                           ),
//                         ],
//                         image: DecorationImage(
//                           alignment: Alignment.center,
//                           image: AssetImage("assets/images/haircut.jpg"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             TitleAndPrice(title: "Hair", country: "Ladies & Gents", price: 500),
//             SizedBox(height: kDefaultPadding),
//             Row(
//               children: <Widget>[
//                 SizedBox(
//                   width: size.width / 2,
//                   height: 84,
//                   child: RaisedButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                     color: kPrimaryColor,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MakeAppointment(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       "Book Now",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     onPressed: () {},
//                     child: Text("Description"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }

// AppBar buildAppBar() {
//   return AppBar(
//     backgroundColor: Colors.purple,
//     elevation: 0,
//     // leading: IconButton(
//     //   icon: SvgPicture.asset("assets/icons/menu.svg"),
//     //   onPressed: () {},
//     // ),
//   );
// }
