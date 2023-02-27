import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, "/media");
            //   },
            //   icon: const Icon(
            //     Icons.mediation_outlined,
            //     size: 30,
            //   ),
            // ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/media");
              },
              icon: const Icon(
                Icons.move_up_rounded,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
