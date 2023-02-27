import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediere/models/music.dart';
import 'package:mediere/utils/constants.dart';
import 'package:mediere/utils/store.dart';
import 'package:mediere/widget/botom_bar.dart';
import 'package:mediere/widget/media_list.dart';
import 'package:mediere/widget/media_tiles.dart';
import '../widget/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: const TopAppBar(),
      //   backgroundColor: Colors.white12,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      bottomNavigationBar: const HomeNavBar(
        pageIndex: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const TopAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer(builder: (context, ref, children) {
                      final title = ref.watch(titleProvider);
                      return Text(
                        title,
                        style: GoogleFonts.alike(
                          fontSize: 45,
                          color: const Color.fromRGBO(52, 136, 242, 1),
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      );
                    }),
                    verticalGap,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: MusicList.musicList
                            .map((item) => MediaTiles(
                                  id: item.id,
                                  name: item.category,
                                  subTitle: item.duration,
                                  image: item.image,
                                  location: item.location,
                                ))
                            .toList(),
                      ),
                    ),
                    verticalGap,
                    Text(
                      "Do not hesitate to take action; inaction is the deadliest sin.",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                      ),
                    ),
                    verticalGap,
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   physics: const BouncingScrollPhysics(),
                    //   child: Row(children: const [
                    //     CategoryTiles(
                    //       isactive: true,
                    //       name: "Relax",
                    //     ),
                    //     CategoryTiles(
                    //       isactive: false,
                    //       name: "Yoga",
                    //     ),
                    //     CategoryTiles(
                    //       isactive: false,
                    //       name: "Motivation",
                    //     ),
                    //     CategoryTiles(
                    //       isactive: false,
                    //       name: "Focus",
                    //     ),
                    //     CategoryTiles(
                    //       isactive: false,
                    //       name: "Devetonal",
                    //     ),
                    //     CategoryTiles(
                    //       isactive: false,
                    //       name: "Sleep",
                    //     ),
                    //   ]),
                    // ),
                    verticalGap,
                  ],
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 25,
                //   vertical: 50,
                // ),
                decoration: const BoxDecoration(
                  // color: Color.fromRGBO(233, 243, 253, 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.linear_scale_sharp,
                      size: 40,
                      color: Colors.blue,
                    ),
                    verticalGap,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "MANTRA FOR YOU.",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 26,
                                ),
                              ),
                            ],
                          ),
                          verticalGap,
                          verticalGap,
                          Column(
                            children: MusicList.musicList
                                .map((music) => MediaList(
                                    id: music.id,
                                    name: music.name,
                                    image: music.image,
                                    location: music.location,
                                    category: music.category))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
