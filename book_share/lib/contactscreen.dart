
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget{

  @override
  State<ContactScreen> createState() => _ContactScreenState();

}

class _ContactScreenState extends State<ContactScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        
        children: [
          const SizedBox(height: 10,),
          ContactUs(
            
            logo:  const AssetImage("assets/images/gana.jpg",),
            email: "godaseganesh4594@gmail.com",
            companyName: "Ganesh Godase",
            dividerThickness: 5,
            phoneNumber: "+91 8767206494",
            githubUserName: "ganeshgodase4594",
            linkedinURL: "https://www.linkedin.com/in/ganesh-godase-3aba1a21b/",
            twitterHandle: "https://twitter.com/GaneshG40108564",
            instagram: "https://www.instagram.com/godase.g_a_n_a/",
            textColor: Colors.black,
            cardColor: Colors.white,
            taglineColor: Colors.white,
            companyColor: Colors.teal.shade300,
            avatarRadius: 65,
          ),
          Container(
            color:Colors.teal.shade300 ,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                  "Designed And Developed by Vishal Nanaware and Ganesh Godase",
                  style: GoogleFonts.hankenGrotesk(
                    color:Colors.white,
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
            ),
          ),
        ],
      )

    );
  }
}