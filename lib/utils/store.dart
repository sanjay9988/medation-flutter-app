import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediere/models/music.dart';

final titleProvider = Provider((ref) => 'MEDIERE');
final musicCardProvider = StateProvider<Music?>((ref) => null);
final repeatMode = StateProvider<bool>((ref) => true);
final timer = StateProvider<int>((ref) => 0);
final darkMode = StateProvider<bool>((ref) => false);
