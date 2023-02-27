class Music {
  final int id;
  final String name;
  final String image;
  final String location;
  final String category;
  final bool isPlaying;
  final String duration;

  Music({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.category,
    required this.isPlaying,
    required this.duration,
  });
}

class MusicList {
  static final musicList = [
    Music(
      id: 0,
      name: "Mahamrityunjaya Mantra",
      image: "assets/sleep.png",
      location:
          "https://cdn.isha.ws/private/maha-mrityunjaya-mantra/Maha-Mrutyunjaya-Mantra-108-cycles.mp3",
      category: "Devotional",
      isPlaying: false,
      duration: "36min",
    ),
    Music(
      id: 1,
      name: "Nirvana Shatakam",
      image: "assets/nirvana.jpg",
      location:
          "https://public-isha.sadhguru.org/msr/downloads/music/Nirvana-Shatakam.mp3?_ga=2.59544618.629386561.1677427441-869820080.1676217471",
      category: "Nirvana",
      isPlaying: false,
      duration: "9min",
    ),
    Music(
      id: 2,
      name: "Calm my mind",
      image: "assets/calm-my-mind.png",
      location:
          "https://cdn.pixabay.com/download/audio/2022/11/11/audio_84306ee149.mp3?filename=please-calm-my-mind-125566.mp3",
      category: "MindFulness",
      isPlaying: false,
      duration: "3min",
    ),
    Music(
      id: 3,
      name: "Relax yogar meditation",
      image: "assets/yoga.png",
      location:
          "https://cdn.pixabay.com/download/audio/2021/08/28/audio_ddc240ccb4.mp3?filename=music-for-relax-yoga-meditation-7783.mp3",
      category: "Spritual",
      isPlaying: false,
      duration: "6min",
    ),
    Music(
      id: 4,
      name: "When it rains",
      image: "assets/rain.png",
      location:
          "https://cdn.pixabay.com/download/audio/2022/06/06/audio_e9200f1a0c.mp3?filename=for-when-it-rains-112785.mp3",
      category: "Sleep",
      isPlaying: false,
      duration: "5min",
    ),
    Music(
      id: 5,
      name: "Healing Sound",
      image: "assets/focus.png",
      location:
          "https://cdn.pixabay.com/download/audio/2022/10/26/audio_5435e2e099.mp3?filename=healing-sounds-124056.mp3",
      category: "Focused",
      isPlaying: false,
      duration: "21min",
    ),
    Music(
      id: 6,
      name: "Birds and piano",
      image: "assets/birds-and-piano.png",
      location:
          "https://cdn.pixabay.com/download/audio/2023/01/29/audio_580d2c877d.mp3?filename=relaxing-birds-and-piano-music-137153.mp3",
      category: "Visualization",
      isPlaying: false,
      duration: "37min",
    ),
    Music(
      id: 7,
      name: "Forest Lullaby",
      image: "assets/forest.jpg",
      location:
          "https://cdn.pixabay.com/download/audio/2022/05/05/audio_1395e7800f.mp3?filename=forest-lullaby-110624.mp3",
      category: "Forest",
      isPlaying: false,
      duration: "3min",
    ),
  ];
}
