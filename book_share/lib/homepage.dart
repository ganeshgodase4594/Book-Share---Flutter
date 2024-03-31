import 'package:book_share/Controller/BookController.dart';
import 'package:book_share/addbookdata.dart';
import 'package:book_share/background.dart';
import 'package:book_share/backgroundimage.dart';
import 'package:book_share/bookdetail.dart';
import 'package:book_share/congratulations.dart';
import 'package:book_share/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  List<Book> booksobj = [];

  List<Book> popularBook = [];

  final BookController _bookController = Get.put(BookController());

  @override
  void initState() {
    super.initState();

    getBookData();
  }

  Future<void> getBookData() async {
    try {
      List<Book> obj = await Book.getBookData();
      List<Book> obj1 = await Book.getBookData();

      setState(() {
        booksobj = obj;
        popularBook = obj1;
        popularBook = sortBookByRating(popularBook);
      });
    } catch (e) {}
  }

  List<Book> sortBookByRating(List<Book> obj) {
    obj.sort(((a, b) {
      return -(a.rating.compareTo(b.rating));
    }));

    return obj;
  }

  @override
  Widget build(BuildContext context) {
    print("Length:  ${popularBook.length}");
    print("Popular Book: ${popularBook}");
    if (booksobj.isNotEmpty) {
      return Scaffold(
          // backgroundColor: Color.fromARGB(255, 238, 238, 238),
          body: SingleChildScrollView(
        child: BackGround(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  Text(
                    "Book of the week",
                    style: GoogleFonts.hankenGrotesk(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
                    booksobj[6].bookimg,
                    width: 90,
                    height: 134,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                         booksobj[6].booktitle,
                          style: GoogleFonts.hankenGrotesk(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ),
                        Text(
                            booksobj[6].bookdesc,
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
                              child: GestureDetector(
                                onTap: () {
                                  purchaseBook(booksobj[6]);
                                },
                                child: Text(
                                  "Grab Now",
                                  style: GoogleFonts.hankenGrotesk(
                                      textStyle: const TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return BookDetails(book: booksobj[6]);
                                }));
                              },
                              child: Text(
                                "Learn more",
                                style: GoogleFonts.hankenGrotesk(
                                    textStyle: const TextStyle(
                                        color: Color.fromRGBO(77, 80, 108, 1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                              ),
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
                          final Book book = booksobj[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookDetails(book: book)),
                              );
                            },
                            child: Container(
                              width: 98,
                              height: 148,
                              margin: const EdgeInsets.only(left: 14),
                              child: Image.asset(
                                booksobj[index].bookimg,
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
                        itemCount: popularBook.length,
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
                                  popularBook[index].bookimg,
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
                                      popularBook[index].booktitle,
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
                                      popularBook[index].authorname,
                                      style: GoogleFonts.hankenGrotesk(
                                          textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          popularBook[index].rating.toString(),
                                          style: GoogleFonts.hankenGrotesk(
                                              textStyle: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.red)),
                                        ),
                                        Text(
                                          " | Based on ${popularBook[index].bookReviews}k Reviews ",
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
                                    (popularBook[index].bookCount == 0)
                                        ? Text(
                                            "Out of Stock",
                                            style: GoogleFonts.hankenGrotesk(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.red)),
                                          )
                                        : Text(
                                            "In Stock",
                                            style: GoogleFonts.hankenGrotesk(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.green)),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_rupee_outlined,
                                          size: 14,
                                        ),
                                        Text(
                                          "${popularBook[index].bookPrice}.00",
                                          style: GoogleFonts.hankenGrotesk(
                                              textStyle: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        purchaseBook(popularBook[index]);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 79,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                222, 119, 115, 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return BookDetails(
                                            book: popularBook[index],
                                          );
                                        }));
                                      },
                                      child: Text(
                                        "Learn more",
                                        style: GoogleFonts.hankenGrotesk(
                                            textStyle: const TextStyle(
                                                color: Color.fromRGBO(
                                                    77, 80, 108, 1),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700)),
                                      ),
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
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void purchaseBook(Book bookObj) {
    _bookController.purchaseBookPrice.value = bookObj.bookPrice;
    _bookController.bookQuantity.value = 1;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        bookObj.bookimg,
                        height: 150,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Do you want to purchase ? "),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: Column(children: [
                            const Text("Price"),
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_rupee_outlined,
                                  size: 14,
                                ),
                                Text(
                                  "${_bookController.purchaseBookPrice.value}.00",
                                  style: GoogleFonts.hankenGrotesk(
                                      textStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            )
                          ])),

                          // const Spacer(),
                          Column(
                            children: [
                              const Text("Select Qty"),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                        _bookController.bookQuantity.value++;
                                        _bookController.purchaseBookPrice.value =  calculatePrice(originalPrice: bookObj.bookPrice,bookQnty: _bookController.bookQuantity.value);
                                      
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 109, 109, 109)),
                                          color: const Color.fromARGB(
                                              255, 189, 189, 189)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6,),
                                  Container(
                                    height: 25,
                                    width: 40,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 109, 109, 109))),
                                    child: Text(_bookController.bookQuantity.value.toString()),
                                  ),
                                  const SizedBox(width: 6,),
                                  GestureDetector(
                                    onTap: (){
                                      int qty = _bookController.bookQuantity.value;
                                      if(--qty>=0){             
                                        -- _bookController.bookQuantity.value;
                                        _bookController.purchaseBookPrice.value =  calculatePrice(originalPrice: bookObj.bookPrice,bookQnty: _bookController.bookQuantity.value);
                                      }
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 109, 109, 109)),
                                          color: const Color.fromARGB(
                                              255, 189, 189, 189)),
                                      child:  const Icon(FontAwesomeIcons.minus,size: 18,color: Color.fromARGB(255, 65, 65, 65)),)
                                    ),
                                ]
                                  )
                                ],
                              )
                            ],
                          ),
                        
                   
                      
                       const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  CongratulationsScreen()),
                             );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.greenAccent),
                              child: Text(
                                "Yes",
                                style: GoogleFonts.hankenGrotesk(
                                    textStyle: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.redAccent),
                            child: GestureDetector(
                              onTap: () {
                                navigator?.pop(context);
                              },
                              child: Text(
                                "No",
                                style: GoogleFonts.hankenGrotesk(
                                    textStyle: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]
                  
                  ))
                  ),
            )

            );
          });
        });
  }

  int calculatePrice({ required int originalPrice, required int bookQnty}) {
    return originalPrice * bookQnty;
  }
}
