List<Notification> notification_items = [
  Notification(
      member: "AmogSU",
      timestamp: DateTime.now(),
      message: "Hello everyone! This is my first post.",
      author_img:
          "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552"),
  Notification(
      member: "Sussusamogus",
      timestamp: DateTime.now(),
      message: "Thats pretty sus if you ask me bro.",
      author_img:
          "https://www4.minijuegosgratis.com/v3/games/thumbnails/238179_7_sq.jpg"),
  Notification(
      member: "Amogdrip",
      timestamp: DateTime.now(),
      message: "Hello everyone! This is my first post.",
      author_img:
          "https://www4.minijuegosgratis.com/v3/games/thumbnails/237101_7_sq.jpg"),
];

class Notification {
  final String member;
  final DateTime timestamp;
  final String message;
  final String author_img;

  Notification(
      {required this.member,
      required this.timestamp,
      required this.message,
      required this.author_img});

  getDifference(DateTime now) {
    int day = now.difference(timestamp).inDays % 365;
    int hour = now.difference(timestamp).inHours % 24;
    int min = now.difference(timestamp).inMinutes % 60;
    int sec = now.difference(timestamp).inSeconds % 60;

    String dif = "";
    if (day > 0) dif = day.toString() + "d ";
    if (hour > 0) dif = dif + hour.toString() + "h ";
    if (min > 0) dif = dif + min.toString() + "m ";
    if (sec > 0) dif = dif + sec.toString() + "s";

    return dif;
  }
}
