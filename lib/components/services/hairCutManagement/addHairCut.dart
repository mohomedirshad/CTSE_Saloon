import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/components/services/hairCutManagement/viewHairStyles.dart';
import 'package:salon_app/dbContext/database.dart';


class AddHairCutScreen extends StatefulWidget {
  @override
  _AddHairCutScreen createState() => _AddHairCutScreen();   
}

class _AddHairCutScreen extends State<AddHairCutScreen> {
  Database db = new Database();
  initialise(){
    db = Database();
    db.initialise();
  }

  //image properties
  File? _image;
  String fileName = '';
  final imagePicker = ImagePicker();

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
      appBar: AppBar(
        leading: BackButton(
        color: Colors.white,
        onPressed: () =>{ 
          Navigator.of(context).popUntil((route)=> route.isFirst),
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_)=> ViewHairStyleScreen(),
            ),
          )},
        ),
        title: new Text(
          "Add new Haircut",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,            
          ),
          ),              
      ),
      body: SingleChildScrollView(
        child: Card(
        margin: EdgeInsets.all(20),        
        color: Colors.blue,        
        shape: RoundedRectangleBorder(          
          borderRadius: BorderRadius.circular(20),          
        ),
        shadowColor: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
          children: [

            //upload and upload button
            Center(
              child: (_image == null)? 
              ElevatedButton(
                onPressed: () async {
                  final pick = await imagePicker.pickImage(source: ImageSource.gallery);                                                        
                  setState(() {
                    if (pick != null) {
                      _image = File(pick.path);
                      var path = pick.path;
                      var _fileName = path.split('/').last;
                      print(_fileName);                  
                      fileName = _fileName;
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No files selected."),duration: Duration(milliseconds: 400),));
                    }
                  });                  
                }, child: Text("Choose Image") ,                                            
              ): ElevatedButton(
                onPressed: () async {
                  final pick = await imagePicker.pickImage(source: ImageSource.gallery);                                                       
                  setState(() {
                    if (pick != null) {
                      _image = File(pick.path);
                      var path = pick.path;
                      var _fileName = path.split('/').last;
                      print(_fileName);                  
                      fileName = _fileName;
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No files selected."),duration: Duration(milliseconds: 400),));
                    }
                  });                  
                }, child: Text(fileName) ,                                            
              ),              
            ),

            Container(              
              margin: EdgeInsets.only(bottom: 33,left: 7, right: 7,top: 10),              
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none, vertical: BorderSide.none),                
                borderRadius: BorderRadius.circular(10),                
              ),              
              child: TextField(
                controller: haircutName,                
                decoration: InputDecoration(
                  hintText: "Add Haircut Name...",                  
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 33,left: 7, right: 7,top: 3),              
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none, vertical: BorderSide.none),                
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: haircutDescription,
                decoration: InputDecoration(hintText: "Add Haircut Description...", focusColor: Colors.cyan),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 33,left: 7, right: 7,top: 3),
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none, vertical: BorderSide.none),                
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: haircutPrice,
                decoration: InputDecoration(hintText: "Add Haircut Price..."),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            MaterialButton(
              child: Container(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(20.0), 
              child: Text(
              "Add",
              style: TextStyle(
                color: Colors.white,
              )),
              ),
              onPressed: (){            
                if(haircutName.text.isEmpty) {
                  return setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(
                      seconds: 1
                    ),
                    content: Text(
                      "Name is required!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    backgroundColor: Colors.red,                
                  ));
                  });
                } 
                if(haircutPrice.text.isEmpty){
                  return setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(
                      seconds: 1
                    ),
                    content: Text(
                      "Price is required!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    backgroundColor: Colors.red,
                  ));
                  });              
                }
                if(haircutDescription.text.isEmpty){
                  return setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(
                      seconds: 1
                    ),
                    content: Text(
                      "Description is required!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    backgroundColor: Colors.red,
                  )); 
                  });             
                } 

                //image upload                
                db.upload(_image, fileName);

                // create hair style          
                db.create(haircutName.text, haircutPrice.text, haircutDescription.text, fileName)
                .whenComplete(() => {
                  
                  // toaster
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(
                      seconds: 1
                    ),
                    content: Text(
                      "Created successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    backgroundColor: Colors.green,
                  )),

                  // screen navigation
                  Navigator.pushReplacement(
                  context, MaterialPageRoute(
                    builder: (_)=>ViewHairStyleScreen()
                    ))
                    });              
                },                       
            )],
        ),        
        ),
      ),            
      )
    );   

  }
    pr(File? file){
      print(file);
    }
  
}