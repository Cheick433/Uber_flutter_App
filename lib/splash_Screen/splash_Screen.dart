import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myfluterap/authentication/login_screen.dart';
import 'package:myfluterap/authentication/signup_screen.dart';
//import 'package:myfluterap/main_screens/main_screen.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:myfluterap/global/global.dart';
import 'package:myfluterap/main_screens/main_screen.dart';
import 'package:myfluterap/main_screens/main_screen_user.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {

    Timer( const Duration(seconds: 3), () async
    {
      if( await fAuth.currentUser != null)
      {
        CurrentFirebaseUser = fAuth.currentUser;
        //Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
        Navigator.push(context, MaterialPageRoute(builder: (c) => mainScreenUser()));


      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      }

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
              const Text(
                "Car App pour les service de livraison",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
