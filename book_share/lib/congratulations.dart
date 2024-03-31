import 'package:book_share/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationsScreen extends StatefulWidget {
  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/congrast.png"),
              Text(
                textAlign: TextAlign.center,
                "Congratulations! You Have Successfully Purchased Book.",
                style: GoogleFonts.hankenGrotesk(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
               GestureDetector(
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                           );
                },
              child:Container(
                height: 52,
                width: 210,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 182, 182),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Continue Purchasing",
                    style: GoogleFonts.hankenGrotesk(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
               ),
            ],
          
          )),
    );
  }
}
