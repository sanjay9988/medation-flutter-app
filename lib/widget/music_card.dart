import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/utils/music_player.dart';
import 'package:mediere/utils/store.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, children) {
      final music = ref.watch(musicCardProvider);
      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Image.asset(
                music == null ? "assets/yoga.png" : music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              padding: const EdgeInsets.only(
                top: 25,
                left: 25,
                bottom: 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.music_note_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        music == null ? "MEDIERE" : music.category,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        music == null ? "FOCUS" : music.duration,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.play_circle_fill_rounded,
                  //         size: 60,
                  //         color: Colors.blue,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
                BoxShadow(
                  color: Colors.white10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        stop();
                        ref
                            .watch(musicCardProvider.notifier)
                            .update((state) => null);
                      },
                      icon: music != null
                          ? Icon(
                              CupertinoIcons.pause_circle,
                              size: 60,
                              color: Colors.amber.shade600,
                            )
                          : const Icon(
                              Icons.music_off,
                              size: 60,
                              color: Colors.white38,
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
