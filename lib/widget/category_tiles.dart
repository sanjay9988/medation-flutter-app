import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTiles extends StatelessWidget {
  final bool isactive;
  final String name;

  const CategoryTiles({super.key, required this.isactive, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color:
              isactive ? const Color.fromRGBO(52, 136, 242, 1) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(52, 136, 242, 1),
          )),
      child: Text(
        name,
        style: GoogleFonts.aBeeZee(
          fontSize: 22,
          color: isactive ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
