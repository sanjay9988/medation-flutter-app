import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/screen/home_screen.dart';
import 'package:mediere/utils/constants.dart';
import 'package:mediere/utils/store.dart';
import 'package:mediere/widget/demo_image_box.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, children) {
                final title = ref.watch(titleProvider);
                return Text(
                  title,
                  style: GoogleFonts.alike(
                    fontSize: 60,
                    color: const Color.fromRGBO(52, 136, 242, 1),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                );
              }),
              verticalGap,
              Container(
                color: Colors.transparent,
                child: const DemoImageBox(),
              ),
              verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Text(
                  "The act of meditation is being spacious.",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalGap,
              Container(
                // alignment: Alignment.bottomCenter,
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width * .6,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(52, 136, 242, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
