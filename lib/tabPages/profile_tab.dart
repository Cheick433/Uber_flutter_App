import 'package:flutter/material.dart';
import 'package:myfluterap/authentication/signup_screen.dart';
import 'package:myfluterap/splash_Screen/splash_Screen.dart';

import '../global/global.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const  Text(
            "Sign out"
        ),
        onPressed: ()
        {
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
        },
      ),
    );
  }
}
