import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_title.dart';

class AuthReset extends StatefulWidget {
  final Function toggleReset;
  AuthReset(this.toggleReset);
  @override
  _AuthResetState createState() => _AuthResetState();
}

class _AuthResetState extends State<AuthReset> {
  GlobalKey<FormState> form;
  String email;
  bool loading;

  @override
  void initState() {
    super.initState();
    form = GlobalKey<FormState>();
    loading = false;
  }

  void showError(String error) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.red[900],
      ),
    );
  }

  void resetPassword() async {
    if (form.currentState.validate()) {
      setState(() {
        loading = true;
      });
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Email has been sent",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
      } on FirebaseAuthException {
        showError("Resend your email");
      }

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthTitle(UniqueKey(), "Reset password"),
                Form(
                  key: form,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: "abc@abc.com",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                            ),
                          ),
                        ),
                        validator: (value) {
                          setState(() {
                            email = value;
                          });
                          if (EmailValidator.validate(value)) {
                            return null;
                          }
                          return "please enter your e-mail";
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: (loading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: StadiumBorder(),
                          onPressed: () {
                            resetPassword();
                          },
                          child: Text(
                            'Reset',
                            key: UniqueKey(),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        widget.toggleReset();
                      });
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
