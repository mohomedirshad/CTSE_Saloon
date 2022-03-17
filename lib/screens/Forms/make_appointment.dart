import 'package:flutter/material.dart';
import 'package:salon_app/components/my_bottom_nav_bar.dart';
import 'package:salon_app/screens/details/components/header.dart';

class MakeAppointment extends StatefulWidget {
  @override
  _FormTestState createState() => _FormTestState();
}

class _FormTestState extends State<MakeAppointment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;

  Widget _buildNameField() {
    return TextFormField(
        maxLength: 20,
        decoration: InputDecoration(hintText: 'Name'),
        maxLines: 1,
        validator: (text) {
          if (text.isEmpty) {
            return 'Name cannot be empty';
          }
          return null;
        },
        onSaved: (text) {
          _name = text;
        });
  }

  Widget _buildPhoneField() {
    return TextFormField(
        maxLength: 20,
        decoration: InputDecoration(hintText: 'Name'),
        maxLines: 1,
        validator: (text) {
          if (text.isEmpty) {
            return 'Name cannot be empty';
          }
          return null;
        },
        onSaved: (text) {
          _name = text;
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithSearchBox(size: size),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    _buildNameField(),
                    _buildPhoneField(),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text('Make Appointment'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(_name);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
