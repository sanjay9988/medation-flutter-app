import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mediere/widget/app_bar.dart';
import 'package:mediere/widget/botom_bar.dart';
import 'package:mediere/utils/constants.dart';
import 'package:mediere/widget/setting_tile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const HomeNavBar(pageIndex: 2),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TopAppBar(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalGap,
                    Text(
                      "MEDIERE SETTINGS",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Colors.blue,
                      ),
                    ),
                    verticalGap,
                    verticalGap,
                    GridView.extent(
                      shrinkWrap: true,
                      primary: false,
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const [
                        SettingTile(
                          title: "Timer 5M",
                          time: 5,
                          status: false,
                        ),
                        SettingTile(
                          title: "Timer 10M",
                          time: 10,
                          status: false,
                        ),
                        SettingTile(
                          title: "Timer 20M",
                          time: 20,
                          status: false,
                        ),
                        SettingTile(
                          title: "Timer 30M",
                          time: 30,
                          status: false,
                        ),
                        SettingTile(
                          title: "Timer 45M",
                          time: 45,
                          status: false,
                        ),
                        SettingTile(
                          title: "Timer 60M",
                          time: 60,
                          status: true,
                        ),
                      ],
                    ),
                    verticalGap,
                    Text(
                      "Do not be afraid of action, Arjuna. For action is the path to right living. If one is not afraid to act, he will be fearless in the face of danger. And if he is fearless in the face of danger, he will be fearless in the face of death. Be fearless, Arjuna! Act boldly! And do not be swayed by fear.",
                      style: GoogleFonts.aBeeZee(),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
