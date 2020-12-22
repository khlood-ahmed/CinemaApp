import 'package:ecommerce/screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  static const routeName = "/Home";
  @override
  _Homescreen createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  int money = 180;
  final int totalmoney = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacementNamed(AuthenticationScreen.routeName);
            },
            child: Text(
              "logout",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Movie App',
          style: TextStyle(
              fontFamily: 'Reem Kufi',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.amber])),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
