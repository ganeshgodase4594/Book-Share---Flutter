import 'package:book_share/homepage.dart';
import 'package:book_share/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class screen1 extends StatefulWidget {
  @override
  State<screen1> createState() => _screen1state();
}

class _screen1state extends State<screen1> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(microseconds: 600),
                        curve: Curves.easeInExpo),
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Color.fromRGBO(157, 157, 157, 1),
                      activeDotColor: Color.fromRGBO(222, 119, 115, 1),
                    ),
                  )
                ],
              ),
      ),
      body: PageView.builder(
          onPageChanged: (index) =>
              setState(() => isLastPage = controller.items.length - 1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
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
                        onPressed: () {
                          pageController.jumpToPage(controller.items.length);
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.hankenGrotesk(
                              color: Color.fromRGBO(41, 43, 56, 1),
                              fontSize: 16),
                        ))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Image.asset(controller.items[index].image),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, top: 00, right: 50, bottom: 10),
                  child: Text(
                    controller.items[index].title,
                    style: GoogleFonts.hankenGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 20, bottom: 10),
                  child: Text(
                    controller.items[index].desc,
                    style: GoogleFonts.hankenGrotesk(
                        fontWeight: FontWeight.w200, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }),
    );
  }


  Widget getStarted() {
    return Scaffold(
      body: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 5.png"),
            ],
          ),
         const SizedBox(
            height: 25,
          ),

          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: MasonryGridView.builder(
                mainAxisSpacing:9,
                crossAxisSpacing: 9,
                  itemCount: 6,
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1),
                      child: Image.asset('assets/images/image${index + 1}.png'),
                    );
                  }
                  )
                  ), 

              Text("Book Has Power To Chnage Everything",
              textAlign: TextAlign.center,
              style: GoogleFonts.hankenGrotesk(
                fontWeight:FontWeight.bold,
                fontSize:20),),

              const SizedBox(height: 15,),
                Text("We have true friend in our life and the books is that. Book has power to chnage yourself and make you more valueable.",
              textAlign: TextAlign.center,
              style: GoogleFonts.hankenGrotesk(
                fontWeight:FontWeight.normal,
                fontSize:14.5,
                color:const Color.fromRGBO(77, 80, 108, 1)),),

                const SizedBox(height: 50,),

           GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  },
  child: Container(
    height: 50,
    width: 220,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(222, 119, 115, 1),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Center(
      child: Text(
        "Get Started Now",
        textAlign: TextAlign.center,
        style: GoogleFonts.hankenGrotesk(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ),
  ),
)

            
        ],
      ),
    );
  }
}

Widget NextPage(){
  return const Scaffold(
    body: Center(
      child: Text("ganesh"),
    ),
  );
}