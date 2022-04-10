import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/components/services/hairCutManagement/viewHairStyles.dart';
import 'package:salon_app/constants.dart';
import 'package:salon_app/components/my_bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      title: 'Salon',
      theme: ThemeData(        
        primaryColor: kPrimaryColor,
      ),
      // home: HomeScreen(),
      home: AnimatedSplashScreen(
        splash: Icons.cut,
        nextScreen: HomeScreen(),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override      
  _HomeScreen createState() => _HomeScreen();  
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Services"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            children: [
              GestureDetector(
                  onTap: (){
                    print("Hair Cutting");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> ViewHairStyleScreen()));
                  },
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hair Cutting",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27
                      ),                      
                    )
                  ],
                ),
              ),                  
              ),
              GestureDetector(
                  onTap: (){print("beauticians booking");},
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Beauticians Booking",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27
                      ),                      
                    )
                  ],
                ),
              ),                  
              ),              
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
    );
  }
}