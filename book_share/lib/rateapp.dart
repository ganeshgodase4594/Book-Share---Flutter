import 'package:book_share/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class rateAppScreen extends StatefulWidget {
  @override
  State<rateAppScreen> createState() => _rateAppScreenState();
}

class _rateAppScreenState extends State<rateAppScreen> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/home1.jpg"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your opinion matters to us!",
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "if you enjoy using book share app,would ypo mind rating on the app Store,then?",
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 50,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                thanksdialogbox();
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Rate us",
                    style: GoogleFonts.hankenGrotesk(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "No,Thanks!",
                style: GoogleFonts.hankenGrotesk(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void thanksdialogbox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Thank you for rating us!",
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Icon(Icons.home)),
            ],
          );
        });
  }
}
