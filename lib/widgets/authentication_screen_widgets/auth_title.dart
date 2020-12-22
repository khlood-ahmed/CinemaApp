import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  AuthTitle(key, this.title) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      /*margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.010),*/
      child: Column(
        children: [
          Text(
            "$title",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
