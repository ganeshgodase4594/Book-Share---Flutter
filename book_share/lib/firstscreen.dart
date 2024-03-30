

import 'dart:async';
import 'package:book_share/screen1.dart';
import 'package:flutter/material.dart';
class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _screen1state();
}

class _screen1state extends State<splashscreen> {


  void initState(){
    super.initState();

    Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
            return screen1();
          }));
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/Splash.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

        ],
      ),
    );
  }
}
