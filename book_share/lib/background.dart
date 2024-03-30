
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({super.key, 
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
  final  size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -5,
            child: SvgPicture.asset("assets/images/backimage.svg")),
          child
        ],
      ),
    );
  }
}