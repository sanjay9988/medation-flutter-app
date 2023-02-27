import 'package:flutter/material.dart';
import 'package:mediere/screen/home_screen.dart';
import 'package:mediere/screen/media_screen.dart';
import 'package:mediere/screen/settings.dart';

class HomeNavBar extends StatefulWidget {
  final int pageIndex;

  const HomeNavBar({
    super.key,
    required this.pageIndex,
  });

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  void _onItemTapped(int index) {
    if (index != widget.pageIndex) {
      if (index == 0) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } else if (index == 1) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MediaScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Settings(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      currentIndex: widget.pageIndex,
      elevation: 0,
      backgroundColor: Colors.white24,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.mediation_rounded),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.move_up_rounded),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer_outlined),
          label: "",
        ),
      ],
    );
  }
}
