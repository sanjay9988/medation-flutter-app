import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/utils/constants.dart';
import 'package:mediere/utils/music_player.dart';
import 'package:mediere/utils/store.dart';

class SettingTile extends StatefulWidget {
  final String title;
  final int time;
  final bool status;
  const SettingTile({
    super.key,
    required this.title,
    required this.status,
    required this.time,
  });

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(width: 10, color: Colors.white60),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
          ),
          BoxShadow(
            color: Colors.white,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.title,
            style: GoogleFonts.aBeeZee(
              color: Colors.blue.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 0.2,
            ),
          ),
          verticalGap,
          Consumer(builder: (context, ref, children) {
            final isactive = ref.watch(timer);

            if (isactive == widget.time) {
              Timer(Duration(minutes: widget.time), () {
                stop();
                ref.watch(timer.notifier).update((state) => 0);
                ref.watch(musicCardProvider.notifier).update((state) => null);
              });
            }

            return CupertinoSwitch(
              value: isactive == widget.time ? true : false,
              trackColor: Colors.black45,
              activeColor: Colors.blue,
              onChanged: (value) async {
                if (value == true) {
                  ref.watch(timer.notifier).update((state) => widget.time);
                } else {
                  ref.watch(timer.notifier).update((state) => 0);
                }
              },
            );
          }),
        ]),
      ),
    );
  }
}
