import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/dbContext/database.dart';

import '../../../main.dart';

class EditHairCutScreen extends StatefulWidget {
  DocumentSnapshot docid;
  EditHairCutScreen({this.docid});

  @override
  _EditHairCutScreen createState() => _EditHairCutScreen();
}

class _EditHairCutScreen extends State<EditHairCutScreen> {

  Database db;
  initialise(){
    db = Database();
    db.initialise();
  }

  @override
  void initState() {
    id = TextEditingController(text: widget.docid.id);
    print(id);
    haircutName = TextEditingController(text: widget.docid.get('name'));
    haircutDescription = TextEditingController(text: widget.docid.get('description'));
    haircutPrice = TextEditingController(text: widget.docid.get('price'));
    // haircutTimeStamp = TextEditingController(text: widget.docid.get('timestamp'));
    super.initState();
    initialise();
  }

   
  TextEditingController id = new TextEditingController();
  TextEditingController haircutName = new TextEditingController();
  TextEditingController haircutDescription = new TextEditingController();
  TextEditingController haircutPrice = new TextEditingController();
  // TextEditingController haircutTimeStamp = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        MaterialButton(onPressed: (){
          
          db.update(id.text, haircutName.text, haircutPrice.text, haircutDescription.text)
          // widget.docid.reference.update({
          //   "name": haircutName.text,
          //   // "content": content.tex,
          // })
          .whenComplete(() => {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_)=>HomeScreen()
            ))
        });
        },
        child: Text("Save"),
        ),
        MaterialButton(onPressed: (){
          widget.docid.reference.delete().whenComplete(() => {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_)=>HomeScreen()
            ))
        });
        },
        child: Text("Delete Haircut"),
        ),
      ],
      ),
      body: Container(
        child: Column(
          children: [            
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: haircutName,
                decoration: InputDecoration(hintText: "haircut name"),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: haircutPrice,
                decoration: InputDecoration(hintText: "haircut price"),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: haircutDescription,
                decoration: InputDecoration(hintText: "haircut description"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Expanded(
            //   child:Container(
            //   decoration: BoxDecoration(border: Border.all()),
            //   child: TextField(
            //     controller: service,
            //     expands: true,
            //     maxLines: null,
            //     decoration: InputDecoration(hintText: "content"),
            //   ),
            // ), 
            //   )
          ],
        ),
      ),
    );
  }
}