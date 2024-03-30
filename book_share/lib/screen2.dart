
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class screen2 extends StatefulWidget {
  State<screen2> createState() => _screen2state();
}

class _screen2state extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(
                      77,
                      80,
                      108,
                      1,
                    ),
                    size: 20,
                  )),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: GoogleFonts.hankenGrotesk(
                        color: Color.fromRGBO(41, 43, 56, 1), fontSize: 16),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            child: Image.asset("assets/images/Group2.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,top: 5,right: 50,bottom: 10),
            child: Text("Learn Smartly",
            style: GoogleFonts.hankenGrotesk(fontWeight:FontWeight.bold,
            fontSize:24),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 20,bottom: 10),
            child: Text("It’s 2022 and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your laptop or PC.",
            style: GoogleFonts.hankenGrotesk(fontWeight:FontWeight.w200,
            fontSize:14),
            textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
