import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

class MusicPlayer {
  final String location;
  MusicPlayer({required this.location});

  void play() async {
    await player.setReleaseMode(ReleaseMode.release);
    await player.play(UrlSource(location));
    await player.setReleaseMode(ReleaseMode.loop);
  }
}

void stop() async {
  await player.stop();
}
