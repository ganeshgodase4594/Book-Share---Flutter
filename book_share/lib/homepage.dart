import 'package:book_share/addbookdata.dart';
import 'package:book_share/background.dart';
import 'package:book_share/backgroundimage.dart';
import 'package:book_share/bookdetail.dart';
import 'package:book_share/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {

  final List<Book> booksobj=[
    book1,book2,book3,book4,book5,book6
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: SingleChildScrollView(
      child: BackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                    const Spacer(),
                    Text("Book of the week",style: GoogleFonts.hankenGrotesk(fontSize:20,fontWeight:FontWeight.bold),),
                    const Spacer(),
                    IconButton(
                    onPressed: () {}, icon: const Icon(Icons.menu)),
                
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(0, 4),
                      blurRadius: 45)
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Mask_group-removebg-preview.png",
                  width: 90,
                  height: 134,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Psychology of Money",
                        style: GoogleFonts.hankenGrotesk(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                      Text(
                          "The psychology of money is the study of our behavior with money. Success with money isn't about knowledge, IQ or how good you are at math. It's about behavior, and everyone is prone to certain behaviors over others.",
                          style: GoogleFonts.hankenGrotesk(
                              textStyle: const TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.w400))),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 87,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(222, 119, 115, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Grab Now",
                              style: GoogleFonts.hankenGrotesk(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Learn more",
                            style: GoogleFonts.hankenGrotesk(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(77, 80, 108, 1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommanded for you",
                    style: GoogleFonts.hankenGrotesk(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(77, 80, 108, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      
                      scrollDirection: Axis.horizontal,
                      itemCount: booksobj.length,
                      itemBuilder: (BuildContext context, int index) {

                        final Book book=booksobj[index];

                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  BookDetails(book: book)),
                          );
                          },
                          child: Container(
                              width: 98,
                              height: 148,
                              margin:const EdgeInsets.only(left: 8),
                              child: Image.asset(
                                  BackGroundImage.backGroundImage[index % BackGroundImage.backGroundImage.length],
                                  height: 98,
                                  width: 148,
                                  fit: BoxFit.cover,
                              ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Popular Books",
                    style: GoogleFonts.hankenGrotesk(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(77, 80, 108, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w700))),
                
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                BackGroundImage.backGroundImage[(index +4 )%
                                    BackGroundImage.backGroundImage.length],
                                width: 65,
                                height: 86,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The Steal Like An Artist",
                                    style: GoogleFonts.hankenGrotesk(
                                        textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Austin Kleon",
                                    style: GoogleFonts.hankenGrotesk(
                                        textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "5.0 ",
                                        style: GoogleFonts.hankenGrotesk(
                                            textStyle: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red)),
                                      ),
                                      Text(
                                        " | Based on 23k Reviews ",
                                        style: GoogleFonts.hankenGrotesk(
                                            textStyle: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                        )),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "\$45.87",
                                    style: GoogleFonts.hankenGrotesk(
                                        textStyle: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 79,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            222, 119, 115, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Grab Now",
                                      style: GoogleFonts.hankenGrotesk(
                                          textStyle: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Learn more",
                                    style: GoogleFonts.hankenGrotesk(
                                        textStyle: const TextStyle(
                                            color:
                                                Color.fromRGBO(77, 80, 108, 1),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}