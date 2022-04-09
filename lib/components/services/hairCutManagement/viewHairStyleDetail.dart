import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/components/services/hairCutManagement/editHairCut.dart';
import 'package:salon_app/components/services/hairCutManagement/viewHairStyles.dart';
import 'package:salon_app/dbContext/database.dart';

// ignore: must_be_immutable
class ViewHairCutScreen extends StatefulWidget {
  DocumentSnapshot docid;
  ViewHairCutScreen({required this.docid});

  @override
  _ViewHairCutScreen createState() => _ViewHairCutScreen();
}

class _ViewHairCutScreen extends State<ViewHairCutScreen> {
  Database db = new Database();
  initialise(){
    db = Database();
    db.initialise();
  }

  @override
  void initState() {
    id = TextEditingController(text: widget.docid.id);
    haircutName = TextEditingController(text: widget.docid.get('name'));
    haircutDescription = TextEditingController(text: widget.docid.get('description'));
    print(haircutDescription.text);
    haircutPrice = TextEditingController(text: widget.docid.get('price'));
    haircutImage = TextEditingController(text: widget.docid.get('image'));
    super.initState();
    initialise();
  }
  
  TextEditingController id = new TextEditingController();
  TextEditingController haircutName = new TextEditingController();
  TextEditingController haircutDescription = new TextEditingController();
  TextEditingController haircutPrice = new TextEditingController();  
  TextEditingController haircutImage = new TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HairStyle",
          style: TextStyle(
            color: Colors.white
          ),
          ),
        leading: BackButton(
        color: Colors.white,
        onPressed: () =>{ 
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_)=> ViewHairStyleScreen(),
            ),
          )},
        ),
        centerTitle: true,
      ),
      body: Container(        
        margin: EdgeInsets.only(top: 30, bottom: 30, left: 10,right: 10),        
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),        
          color: Colors.blueAccent,
          child: Column(
            children: [
              Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
            ),
            FutureBuilder(
              future: db.downloadImageUrl(haircutImage.text),
              builder: (BuildContext context, AsyncSnapshot<String>snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {                  
                  return Column(              
                    children: [
                      Container(                  
                      height: 200,
                      child: Image.network(
                        snapshot.data!,                  
                        width: 400,
                        height: 200,                            
                        fit: BoxFit.fitHeight,
                      ),
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      ),
                    ],              
                  );   
                }
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return CircularProgressIndicator();                 
                }
                return Container();
              },
            ),

                     
            Text(
              "Haircut Name: "+ haircutName.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
            ),
            Text(
              "Price Rs." + haircutPrice.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
            ),     
            Text(
              haircutDescription.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,                
              ),                            
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
            ),
            MaterialButton(
              onPressed: (){      
              Navigator.pushReplacement( 
                context, MaterialPageRoute(builder: (_)=> EditHairCutScreen(id.text, haircutName.text, haircutPrice.text, haircutDescription.text, haircutImage.text)
                ));
              },
              color: Colors.purple,
              child: Text(
                "Update",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            ],            
          ),                   
        ),                            
      ),
    );
  }
}