import 'package:flutter/material.dart';
import 'package:myfluterap/splash_Screen/splash_Screen.dart';
import 'package:flutter/src/painting/image_provider.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async
{  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

runApp(
  MyApp(


       MaterialApp(
        title: "Driver App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,

      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  const MyApp(this.child);

  static void restartApp(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}

