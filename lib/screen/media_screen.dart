import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/models/music.dart';
import 'package:mediere/utils/constants.dart';
import 'package:mediere/widget/botom_bar.dart';
import 'package:mediere/widget/media_list.dart';
import 'package:mediere/widget/music_card.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavBar(
        pageIndex: 1,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MusicCard(),
            verticalGap,
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "JUST MANTRA",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                    verticalGap,
                    Column(
                      children: MusicList.musicList
                          .map((music) => MediaList(
                                id: music.id,
                                name: music.name,
                                image: music.image,
                                location: music.location,
                                category: music.category,
                              ))
                          .toList(),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
