import 'package:flutter/material.dart';
import 'package:salon_app/dbContext/database.dart';
import 'package:salon_app/main.dart';


class AddHairCutScreen extends StatefulWidget {
  @override
  _AddHairCutScreen createState() => _AddHairCutScreen();
    
}

class _AddHairCutScreen extends State<AddHairCutScreen> {
  Database db;
  initialise(){
    db = Database();
    db.initialise();
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  TextEditingController haircutName = new TextEditingController();
  TextEditingController haircutPrice = new TextEditingController();
  TextEditingController haircutDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        MaterialButton(
          onPressed: (){            
            db.create(haircutName.text, haircutPrice.text, haircutDescription.text)
            .whenComplete(() => Navigator.pushReplacement(
              context, MaterialPageRoute(
                builder: (_)=>HomeScreen())));
        },
        child: Text("Add Haircut"),
        ),
        
      ],),
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
                controller: haircutDescription,
                decoration: InputDecoration(hintText: "haircut description"),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: haircutPrice,
                decoration: InputDecoration(hintText: "haircut price"),
              ),
            ),
            SizedBox(
              height: 10,
            ),            
          ],
        ),
      ),
    );
  }
}