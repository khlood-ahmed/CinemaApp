import 'package:ecommerce/widgets/authentication_screen_widgets/auth_background.dart';
import 'package:ecommerce/widgets/authentication_screen_widgets/auth_form.dart';
import 'package:ecommerce/widgets/authentication_screen_widgets/auth_reset.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = "/auth-screen";
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool resetPass;
  @override
  void initState() {
    super.initState();
    resetPass = false;
  }

  void toggleReset() {
    setState(() {
      resetPass = !resetPass;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              AuthBackground(),
              AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                right: (resetPass) ? 0 : -MediaQuery.of(context).size.width,
                child: AuthReset(toggleReset),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                left: (!resetPass) ? 0 : -MediaQuery.of(context).size.width,
                child: AuthForm(toggleReset),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
