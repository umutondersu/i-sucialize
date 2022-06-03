import 'package:cloud_firestore/cloud_firestore.dart';

List<Feed> feed_items = [
  Feed(
      username: "i/Amogdrip",
      message: "Amongus Drip Vcdoded will eventually decrease.",
      time: DateTime.now(),
      vote: 243,
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQPVQnqNXXsWAVKGXH4UrwtNLqC2S5kfI8ug&usqp=CAU",
      avatarUrl:
      "https://m.media-amazon.com/images/I/316sTqrlXEL._AC_SY780_.jpg"),
  Feed(
      username: "i/AskAmong",
      message: "What will be the changes in nowadays muders???",
      time: DateTime.now(),
      vote: 23,
      image: "https://i0.wp.com/wroxe.com/wp-content/uploads/2020/11/among-us-terimleri.jpg?fit=1024%2C576&ssl=1",
      avatarUrl:
      "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg"),

  Feed(
      username: "i/AskAmong",
      message: "What will be the changes in nowadays muders???",
      time: DateTime.now(),
      vote: 75,
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-fl7WquKe41BELr0xds7aTnHlXYqEcswivg&usqp=CAU",
      avatarUrl:
      "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg"),
  Feed(
      username: "i/AmogNews",
      message: "Today news on AmongNews...",
      time: DateTime.now(),
      vote: 36,
      image: "https://img.game-news24.com/2021/10/Among-Us-Console-Edition-From-Tomorrow-Than-Expected.jpeg",
      avatarUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJmqSGd5IdcQuqo9UxLnw3GUQwnUqKXlUtQ&usqp=CAU"),
  Feed(
      username: "i/AmogGeeks",
      message: "New Sci Fi movie AmogTheSpaceMan was great again!!!",
      time: DateTime.now(),
      vote: 76,
      image: "http://ictmedia.com.tr/Media/News/9765.jpg",
      avatarUrl:
      "https://pbs.twimg.com/media/EjJQLeLWkAE-RXF.jpg"),
  Feed(
      username: "i/Amogcute",
      message: "Are you so cute too!!! I am too cute kawai uwu!!!",
      time: DateTime.now(),
      vote: 55,
      image: "https://www.savebutonu.com/wp-content/uploads/2021/03/uwu_1000x700.jpg",
      avatarUrl:
      "https://i.pinimg.com/474x/b0/63/98/b0639897a0248b50cebee54e6908e4bb.jpg"),
];

/*
var db =  FirebaseFirestore.instance;
Future<List<Feed>>getFeeds() async {
  List<Feed> list = <Feed>[];
  var docs = await db.collection("posts").orderBy("date").limit(20).get().then((result){
    print(result);
  });

   /*.then((QuerySnapshot q) => (){
     print(q);
     q.docs.forEach((DocumentSnapshot doc) => (){
       print(doc);
       list.add(Feed(
            username: doc.get("username"),
            message: doc.get("post"),
            time: doc.get("date"),
            vote: doc.get("votes"),
            image: doc.get("image")));
      });
   });*/
//.withConverter(fromFirestore: Feed.fromFirestore, toFirestore: (Feed feed, _) => feed.toFirestore());

 return list;
}

*/
class Feed {
  final String username;
  final String message;
  final DateTime time;
  final int vote;
  final String  image;
  final String avatarUrl;

  /*
  factory Feed.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();

    return Feed(
      username: data?['username'],
      message: data?['post'],
      time: data?['date'],
      image: data?['image'],
      vote: data?['votes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (username != null) "name": username,
      if (message != null) "post": message,
      if (time != null) "date": time,
      if (image != null) "image": image,
      if (vote != null) "votes": vote,
    };
  }
*/
  Feed(
    { required this.username,
      required this.message,
      required this.time,
      required this.vote,
      required this.image,
      required this.avatarUrl,
    });

  getDifference(DateTime now) {
    int day = now.difference(time).inDays % 365;
    int hour = now.difference(time).inHours % 24;
    int min = now.difference(time).inMinutes % 60;
    int sec = now.difference(time).inSeconds % 60;

    String dif = "";
    if (day > 0) dif = day.toString() + "d ";
    if (hour > 0) dif = dif + hour.toString() + "h ";
    if (min > 0) dif = dif + min.toString() + "m ";
    if (sec > 0) dif = dif + sec.toString() + "s";

    return dif;
  }

}