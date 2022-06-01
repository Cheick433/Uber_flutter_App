import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfluterap/authentication/login_screen.dart';
import 'package:myfluterap/main_screens/main_screen.dart';
import 'package:myfluterap/splash_Screen/splash_Screen.dart';
import 'package:myfluterap/tabPages/home_tab.dart';
import 'package:myfluterap/widgets/progress_dialog.dart';
import 'package:myfluterap/global/global.dart';
import 'package:firebase_auth/firebase_auth.dart';




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}




class _SignUpScreenState extends State<SignUpScreen>
{

  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  TextEditingController PasswordtextEditingController = TextEditingController();

  validateForm()
  {
    if(nametextEditingController.text.length < 3)
    {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    }
    else if(!emailtextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    }
    else if(phonetextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    }
    else
    {
      saveUserInfo()();



      }
  }

  saveUserInfo() async
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

      await fAuth.createUserWithEmailAndPassword(

      email : emailtextEditingController.text.trim(),
        password : PasswordtextEditingController.text.trim(),

        ).catchError((msg){
           Navigator.pop(context);
           Fluttertoast.showToast(msg:"Error"+msg.toString());

        })
        ).user;

        if(firebaseUser != null)
        {
           Map driverMap =
           {
             "id": firebaseUser.uid,
             "name": nametextEditingController.text.trim(),
             "email": nametextEditingController.text.trim(),
             "phone": phonetextEditingController.text.trim(),

           };
           DatabaseReference driverRef = FirebaseDatabase.instance.ref().child("drivers");
           driverRef.child(firebaseUser.uid).set(driverMap);

           CurrentFirebaseUser= firebaseUser;
           Fluttertoast.showToast(msg:"User cree par succes");
           Navigator.push(context , MaterialPageRoute(builder: (c)=> MySplashScreen()));

        }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/logo.png'),
              ),

             const Text(
                "Register as Driver",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: nametextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Name",
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
                controller: phonetextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Phone",
                  hintText: "Phone",
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
                    validateForm();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                  ),

                  child: const Text(
                    "create Account",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
              ),

              TextButton(
                child: const Text(
                  "Aready have an Account? Login Here",
                  style: TextStyle(color:  Colors.grey),
                ),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
                },
              ),


            ],
          ),
        ),
      ),
      
    );
  }
}
