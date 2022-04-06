// import 'package:flutter/material.dart';
// import 'package:salon_app/dbContext/database.dart';
// import '../../../constants.dart';

// class OurServices extends StatefulWidget {
//   const OurServices({
//     Key key, this.title,
//   }) : super(key: key);


//   final String title;

//   @override
//   _ViewServicesPageState createState() => _ViewServicesPageState();
  
// }


// class _ViewServicesPageState extends State<OurServices>{
//   Database db;
  
//   List docs = [];

//   initialise(){
//     db = Database();
//     db.initialise();
//     db.read().then((value) => {
//       setState((){
//         docs = value;
//       })
//     });
//   }

//   @override
//   void initState(){
//     super.initState();
//     initialise();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemBuilder:(BuildContext context, int index){
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               contentPadding: EdgeInsets.only(right: 30, left: 36),
//               title: Text(docs[index]["name"]),
//               trailing: Text(docs[index]["price"]),
//             ),
//           );
//         }
//         ),
//     );
//   }
// }


// class RecomendPlantCard extends StatelessWidget {
//   const RecomendPlantCard({
//     Key key,
//     this.image,
//     this.title,
//     this.country,
//     this.price,
//     this.press,
//   }) : super(key: key);

//   final String image, title, country;
//   final int price;
//   final Function press;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(
//         left: kDefaultPadding,
//         top: kDefaultPadding / 2,
//         bottom: kDefaultPadding * 2.5,
//       ),
//       width: size.width * 0.6,
//       child: Column(
//         children: <Widget>[
//           Image.asset(image),
//           GestureDetector(
//             onTap: press,
//             child: Container(
//               padding: EdgeInsets.all(kDefaultPadding / 2),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 10),
//                     blurRadius: 50,
//                     color: kPrimaryColor.withOpacity(0.23),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                             text: "$title\n".toUpperCase(),
//                             style: Theme.of(context).textTheme.button),
//                         TextSpan(
//                           text: "$country".toUpperCase(),
//                           style: TextStyle(
//                             color: kPrimaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     '\LKR $price \Up',
//                     style: Theme.of(context)
//                         .textTheme
//                         .button
//                         .copyWith(color: kPrimaryColor),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
