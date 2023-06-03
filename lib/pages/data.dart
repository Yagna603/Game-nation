class GameImage {
  String url;
  String title;

  GameImage(this.url, this.title);
}

class Game {
  String title;
  GameImage coverImage;
  List<GameImage>? images;
  String description;
  String studio;

  Game(this.coverImage, {required this.title, required this.description, required this.studio});
}

List<Game> games = [
  Game(
    title: "Mortal Kombat 11",
    GameImage(
        "lib/images/6.jpg",
        ""),
    description: "",
    studio: "Guerrilla Games",
  ),
  Game(
    title: "Asphalt Legends",
    GameImage(
        "lib/images/7.jpg",
        ""),
    description: "",
    studio: "4A Games",
  ),
  Game(
    title: "Valorant",
    GameImage(
        "lib/images/8.jpg",
        ""),
    description: "",
    studio: "Massive Entertainment",
  ),
  Game(
    title: "The Withcher 3",
    GameImage(
        "lib/images/9.png",
        ""),
    description: "",
    studio: "Capcom",
  ),
];

List<Game> games2 = [
  Game(
    title: "Halo 5",
    GameImage(
        "lib/images/13.jpg",
        ""),
    description: "",
    studio: "Rockstar Games",
  ),
  Game(
    title: "Assasins Creed",
    GameImage("lib/images/14.png", ""),
    description: "",
    studio: "Naughty Dog",
  ),
  Game(
    title: "For Honor",
    GameImage(
        "lib/images/15.jpg",
        ""),
    description: "",
    studio: "From Software",
  ),
  Game(
    title: "Free Fire",
    GameImage(
        "lib/images/16.jpg",
        ""),
    description: "",
    studio: "Avalanche Studios",
  ),
];

List<Game> featuredGames = [
  Game(
    title: "Total War : Three Kingdoms",
    GameImage(
        "lib/images/0.jpg",
        ""),
    description: "",
    studio: "Feral Interactive",
  ),
  Game(
    title: "Call of Duty",
    GameImage(
        "lib/images/1.jpg",
        ""),
    description: "",
    studio: "Infinity Ward",
  ),
  Game(
    title: "Just Cause 4",
    GameImage(
        "lib/images/2.jpg",
        ""),
    description: "",
    studio: "CyberConnect2",
  ),
  Game(
    title: "Sekiro : Shadows Die Twice",
    GameImage(
        "lib/images/3.jpg",
        ""),
    description: "",
    studio: "NetherRealm Studios",
  )
];