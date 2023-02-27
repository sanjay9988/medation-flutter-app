import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoImageBox extends StatefulWidget {
  const DemoImageBox({super.key});

  @override
  State<DemoImageBox> createState() => _DemoImageBoxState();
}

class _DemoImageBoxState extends State<DemoImageBox> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset("assets/3921140.jpg"),
              Image.asset("assets/3156793.jpg"),
              Image.asset("assets/5184247.jpg"),
            ],
            options: CarouselOptions(
              aspectRatio: 1.4,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "-",
                style: GoogleFonts.aladin(
                  fontSize: 100,
                  color: currentIndex == 0 ? Colors.amber : Colors.black,
                ),
              ),
              Text(
                "-",
                style: GoogleFonts.aladin(
                  fontSize: 100,
                  color: currentIndex == 1 ? Colors.amber : Colors.black,
                ),
              ),
              Text(
                "-",
                style: GoogleFonts.aladin(
                  fontSize: 100,
                  color: currentIndex == 2 ? Colors.amber : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
