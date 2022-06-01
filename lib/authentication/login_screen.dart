import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfluterap/authentication/signup_screen.dart';
import 'package:myfluterap/main_screens/main_screen.dart';
import 'package:myfluterap/main_screens/main_screen_user.dart';
import 'package:myfluterap/splash_Screen/splash_Screen.dart';

import '../global/global.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController PasswordtextEditingController = TextEditingController();

  validateForm()
  {
    if(emailtextEditingController.text.length < 3)
    {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    }

    else if(PasswordtextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Password is requied .");
    }
    else
    {
      //saveDriverInfo();
      loginUser();

    }
  }

  //==============--------

  loginUser() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog("Progressing ! please wait",);
        }
    );

    final User? firebaseUser = (

        await fAuth.signInWithEmailAndPassword(

          email : emailtextEditingController.text.trim(),
          password : PasswordtextEditingController.text.trim(),

        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg:"Error"+msg.toString());

        })
    ).user;

    if(firebaseUser != null)
    {


      CurrentFirebaseUser= firebaseUser;
      Fluttertoast.showToast(msg:"Login success");
      Navigator.push(context , MaterialPageRoute(builder: (c)=> const mainScreenUser()));

    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has been Created.");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/logo.png'),
              ),
              const Text(
                "Login as user",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: emailtextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),

                ),

              ),
              TextField(
                controller: PasswordtextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),

                ),

              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: ()
                {
                  //Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,

                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),

              ),
              TextButton(
                child: const Text(
                  "Already have a account",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => SignUpScreen()));
                },
              ),
            ],

          ),
        ),

      ),

    );
  }
}
