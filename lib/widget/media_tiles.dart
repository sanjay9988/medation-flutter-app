import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/models/music.dart';
import 'package:mediere/screen/media_screen.dart';
import 'package:mediere/utils/music_player.dart';
import 'package:mediere/utils/store.dart';

class MediaTiles extends StatefulWidget {
  final int id;
  final String name;
  final String subTitle;
  final String image;
  final String location;

  const MediaTiles({
    super.key,
    required this.name,
    required this.subTitle,
    required this.image,
    required this.id,
    required this.location,
  });

  @override
  State<MediaTiles> createState() => _MediaTilesState();
}

class _MediaTilesState extends State<MediaTiles> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
              ),
              width: 150,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          // color: Colors.amber,
          height: 200,
          width: 150,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
              BoxShadow(
                color: Colors.white10,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.subTitle,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(builder: (context, ref, children) {
                    final category = ref.watch(musicCardProvider);

                    return InkWell(
                      onTap: () {
                        if (category?.category == widget.name) {
                          ref
                              .watch(musicCardProvider.notifier)
                              .update((state) => null);
                          stop();
                        } else {
                          ref.watch(musicCardProvider.notifier).update(
                              (state) => MusicList.musicList[widget.id]);
                          MusicPlayer(location: widget.location).play();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MediaScreen()));
                        }
                      },
                      child: category?.category != widget.name
                          ? const Icon(
                              Icons.play_circle_fill_rounded,
                              size: 60,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.pause_circle_filled_rounded,
                              size: 60,
                              color: Colors.white,
                            ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
