import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/models/music.dart';
import 'package:mediere/screen/media_screen.dart';
import 'package:mediere/utils/music_player.dart';
import 'package:mediere/utils/store.dart';

class MediaList extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final String location;
  final String category;

  const MediaList({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.category,
  });

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  var isactive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MediaScreen()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MediaScreen()));
              },
              child: Container(
                padding: EdgeInsets.zero,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.aBeeZee(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.category,
                      style: GoogleFonts.aBeeZee(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Consumer(builder: (context, ref, children) {
            final music = ref.watch(musicCardProvider);
            return IconButton(
              onPressed: () {
                setState(() {
                  if (music?.id == widget.id) {
                    ref
                        .watch(musicCardProvider.notifier)
                        .update((state) => null);
                    stop();
                  } else {
                    ref
                        .watch(musicCardProvider.notifier)
                        .update((state) => MusicList.musicList[widget.id]);
                    MusicPlayer(location: widget.location).play();
                  }
                });

                // MusicPlayer(location: widget.location).play();
              },
              icon: music?.id == widget.id
                  ? const Icon(
                      CupertinoIcons.pause,
                      size: 30,
                    )
                  : const Icon(
                      CupertinoIcons.play_circle,
                    ),
            );
          })
        ],
      ),
    );
  }
}
