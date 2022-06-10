

////////////////////////
//     DO NOT USE     //
////////////////////////


/*import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  String email;
  String username;
  String description;
  String img;
  String uid;
  int followers, following, postCount;
  List<String>? posts = List.empty(growable: true);

  User({
    this.email = "example@example.com",
    this.username = "amogus",
    this.description = "Very Sus",
    this.img = "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    this.uid = "",
    this.followers = 0,
    this.following = 0,
    this.postCount = 0,
    this.posts,
  });
}

User? currentUser;
*/
/*
class Profile {
  String email;
  String username;
  String description;
  String img;
  String uid;
  int followers, following, postCount;
  List<String>? posts;

  Profile({
    this.email = "example@example.com",
    this.username = "amogus",
    this.description = "Very Sus",
    this.img = "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    this.uid = "",
    this.followers = 0,
    this.following = 0,
    this.postCount = 0,
    this.posts
  });

  factory Profile.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Profile(
      email: data?['email'],
      username: data?['username'],
      description: data?['description'],
      img: data?['img'],
      uid: data?['uid'],
      followers: data?['followers'],
      following: data?['following'],
      postCount: data?['postCount'],
      posts: data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "username": username,
      "description": description,
      "img": img,
      "uid": uid,
      "followers": followers,
      "following": following,
      "postCount": postCount,
      if (posts != null) "posts": posts,
    };
  }
}

Future<Profile?> getProfile(String uid) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ref = _firestore.collection("users").doc(uid).withConverter(
    fromFirestore: Profile.fromFirestore,
    toFirestore: (Profile profile, _) => profile.toFirestore(),
  );
  final docSnap = await ref.get();
  final profile = docSnap.data();
  return profile;
}

Profile prof = Profile();
*/

/*Profile prof = Profile(
    username: "",
    description: "Very Sus",
    img:
    "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    uid: "",
    followers: 666,
    following: 420,
    postCount: 1);*/