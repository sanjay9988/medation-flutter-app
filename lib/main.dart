import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mediere/screen/demo_screen.dart';
import 'package:mediere/screen/home_screen.dart';
import 'package:mediere/screen/media_screen.dart';
import 'package:mediere/screen/settings.dart';

void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: Mediere(),
    ),
  );
}

class Mediere extends StatelessWidget {
  const Mediere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/demo",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/demo": (context) => const DemoScreen(),
        "/media": (context) => const MediaScreen(),
        "/settings": (context) => const Settings(),
      },
    );
  }
}
