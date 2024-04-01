import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text(
          "Your Feedback",
          style: GoogleFonts.hankenGrotesk(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "We would love to hear your feedback!",
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(Size(50, 50)),
               maximumSize: MaterialStateProperty.all(Size(70, 50)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {

                if(_feedbackController.text.isNotEmpty){
                  _feedbackController.clear();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Feedback submitted",
                        style: GoogleFonts.hankenGrotesk(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        "Thank you for your feedback!",
                        style: GoogleFonts.hankenGrotesk(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Ok",
                            style: GoogleFonts.hankenGrotesk(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
                }
              },
              child: Text(
                "Submit Feedback",
                style: GoogleFonts.hankenGrotesk(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
