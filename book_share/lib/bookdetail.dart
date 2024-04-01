import 'package:book_share/database.dart';
import 'package:book_share/feedbackscreen.dart';
import 'package:book_share/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatefulWidget {
  final Book book;

  const BookDetails({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: 428,
                  height: 304,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(23, 27, 54, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 41,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            const Spacer(),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: const Icon(
                            //     Icons.menu,
                            //     color: Color.fromRGBO(255, 255, 255, 1),
                            //   ),
                            // ),

                            PopupMenuButton(
                              onSelected: (String value) {
                                bookDetailsmenu(value);
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'item1',
                                    child: Row(
                                      children: [
                                        Icon(Icons.home, color: Colors.black),
                                        SizedBox(width: 10),
                                        Text('Home',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'item2',
                                    child: Row(
                                      children: [
                                        Icon(Icons.favorite,
                                            color: Colors.black),
                                        SizedBox(width: 10),
                                        Text('Rate the book',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'item3',
                                    child: Row(
                                      children: [
                                        Icon(Icons.feed, color: Colors.black),
                                        SizedBox(width: 10),
                                        Text('Your feedback',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'item4',
                                    child: Row(
                                      children: [
                                        Icon(Icons.help, color: Colors.black),
                                        SizedBox(width: 10),
                                        Text('Help',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                    bottom: 25,
                                  ),
                                  child: Image.asset(
                                    widget.book.bookimg,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(
                                          widget.book.booktitle,
                                          style: GoogleFonts.hankenGrotesk(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: const Color.fromRGBO(
                                              255,
                                              255,
                                              255,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        widget.book.bookdesc,
                                        style: GoogleFonts.hankenGrotesk(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 8,
                                          color: const Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: List.generate(
                                                  widget.book.rating.toInt(),
                                                  (index) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Color.fromRGBO(
                                                      231, 181, 63, 1),
                                                );
                                              }),
                                            ),
                                          ),
                                          ((widget.book.rating * 10) % 10 == 5)
                                              ? const Icon(
                                                  Icons.star_half_sharp,
                                                  color: Color.fromRGBO(
                                                      231, 181, 63, 1))
                                              : const SizedBox(),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "(${widget.book.rating})",
                                            style: GoogleFonts.hankenGrotesk(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 25,
                  child: Container(
                    height: 92,
                    width: 348,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset('assets/images/man1.png'),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Author",
                                    style: GoogleFonts.hankenGrotesk(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.book.authorname,
                                        style: GoogleFonts.hankenGrotesk(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.star,
                                          color:
                                              Color.fromRGBO(196, 196, 196, 1),
                                          size: 17,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    widget.book.authordesc,
                                    style: GoogleFonts.hankenGrotesk(
                                      fontSize: 8,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 380,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About the book ",
                            style: GoogleFonts.hankenGrotesk(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.book.aboutbook,
                            style: GoogleFonts.hankenGrotesk(
                              color: const Color.fromRGBO(144, 145, 160, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void bookDetailsmenu(String value) {
    double _rating = 0;
    if (value == 'item1') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomePage();
          },
        ),
      );
    } else if (value == 'item2') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Rate The Book",
                style: GoogleFonts.hankenGrotesk(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              content: RatingBar.builder(
                  initialRating: 1,
                  allowHalfRating: true,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  }),
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
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Rate us",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            );
          });
    } else if (value == 'item3') {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return  FeedbackScreen();
          },
        ),
      );

    } else if (value == 'item4') {}
  }
}
