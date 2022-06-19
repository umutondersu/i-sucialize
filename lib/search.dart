// ignore_for_file: prefer_const_constructors, unnecessary_this
import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/profilefriend.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/databaseInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _controller = TextEditingController();
Future<String> getuid(String name) async {
  QuerySnapshot q = await FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: name)
      .get();
  return q.docs[0].id;
}

List<Profilehist> hist = [];

Stream<List<Profilehist>> searchlist() async* {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> stringhist = prefs.getStringList('hist') ?? [];
  hist.clear();

  if (stringhist.isEmpty) {
    prefs.setStringList('hist', []);
    yield hist; //temp
  }
  for (var i = 0; i < stringhist.length; i++) {
    await Future.delayed(const Duration(milliseconds: 20), () {
      hist.add(Profilehist(name: stringhist[i]));
    });
  }
  yield hist;
}
/*
Future<List<Profilehist>> searchlist() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Profilehist> hist = [];
  List<String>? stringhist = prefs.getStringList('hist');
  if (stringhist == null) {
    prefs.setStringList('hist', []);
    hist.add(Profilehist(name: 'umut')); //temp
    return hist;
  }

  for (var i = 0; i < stringhist.length; i++) {
    hist.add(Profilehist(name: stringhist[i]));
  }

  hist.add(Profilehist(name: 'umut')); //temp
  return hist;
}
*/

/*
Stream<Profilehist> histstream() async* {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? stringhist = prefs.getStringList('hist') ?? [];

  if (stringhist.isEmpty) {
    //temp
    prefs.setStringList('hist', []); //temp
    yield Profilehist(name: 'umut'); //temp
  } //temp
  for (var i = 0; i < stringhist.length; i++) {
    yield Profilehist(name: stringhist[i]);
  }
}
*/

//

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Stream<List<Profilehist>> _hist;

  @override
  void initState() {
    _hist = searchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchPageAppBar(),
      body: SearchHistory(),
      backgroundColor: AppColors.mainbackgroundcolor,
    );
  }

  // ignore: non_constant_identifier_names
  StreamBuilder<List<Profilehist>> SearchHistory() {
    return StreamBuilder<List<Profilehist>>(
        stream: _hist,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.backgroundcolor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.backgroundcolor2,
              ),
              child: ListView.builder(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Divider(
                          height: 10.0,
                        ),
                        ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FriendProfileView(uid: snapshot.data![i].uid),
                            ),
                          ),
                          /*leading: CircleAvatar(
                            foregroundColor: Theme.of(context).primaryColor,
                            backgroundColor: AppColors.mainbackgroundcolor,
                            backgroundImage:
                                NetworkImage(snapshot.data![i].getAvatar()),
                          ),*/
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data![i].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appBarTitleTextColor),
                              ),
                              IconButton(
                                  onPressed: () => {
                                        setState(() async {
                                          snapshot.data!.removeAt(i);
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          List<String> hList =
                                              prefs.getStringList('hist')!;
                                          hList.removeAt(i);
                                          prefs.setStringList('hist', hList);
                                        })
                                      },
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.appBarTitleTextColor,
                                  )),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
              /*ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyHist.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    Divider(
                      height: 10.0,
                    ),
                    ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen.asindex(1),
                        ),
                      ),
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: AppColors.mainbackgroundcolor,
                        backgroundImage: NetworkImage(dummyHist[i].avatarUrl),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dummyHist[i].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.appBarTitleTextColor),
                          ),
                          IconButton(
                              onPressed: () => {
                                    setState(() {
                                      dummyHist.removeAt(i);
                                    })
                                  },
                              icon: Icon(
                                Icons.remove,
                                color: AppColors.appBarTitleTextColor,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),*/
              width: 350,
              height: 260,
            ),
          );
        });
  }

/*
  StreamBuilder<QuerySnapshot> UserStream(String name) {
    return StreamBuilder<QuerySnapshot>(
      stream: databaseInterface.getUserFromName(name),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CircleAvatar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: AppColors.mainbackgroundcolor,
          backgroundImage: NetworkImage(snapshot.data!.docs[0]['image']),
        );
      },
    );
  }
  */
}

class SearchPageAppBar extends StatelessWidget with PreferredSizeWidget {
  late String image =
      "https://i.pinimg.com/originals/ce/5f/d3/ce5fd3590095d2aabe3ad6f6203dfe70.jpg";

  void getUserImage() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(databaseInterface.uid)
        .get();
    Map<String, dynamic> data = docSnapshot.data()!;
    image = data['image'];
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: databaseInterface.getUserStream(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return AppBar(
              foregroundColor: AppColors.textcolor,
              backgroundColor: AppColors.primary,
              leadingWidth: 80,
              leading: Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      child: ClipOval(),
                      backgroundColor: AppColors.primary,
                      radius: 100,
                    ),
                  )),
              centerTitle: true,
              title: SearchBar(),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(64, 118, 172, 1), width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      color: Color.fromRGBO(64, 118, 172, 1),
                    ),
                    child:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  ),
                )
              ],
            );
          }
          return AppBar(
            foregroundColor: AppColors.textcolor,
            backgroundColor: AppColors.primary,
            leadingWidth: 80,
            leading: Padding(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        snapshot.data!['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    backgroundColor: AppColors.primary,
                    radius: 100,
                  ),
                )),
            centerTitle: true,
            title: SearchBar(),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(64, 118, 172, 1), width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(70)),
                    color: Color.fromRGBO(64, 118, 172, 1),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      QuerySnapshot q = await FirebaseFirestore.instance
                          .collection('users')
                          .where('username', isEqualTo: _controller.text)
                          .get();
                      if (_controller.text == snapshot.data!['username']) {
                        Navigator.pushNamed(context, '/profile');
                      } else if (q.docs.isNotEmpty) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        List<String> hList = prefs.getStringList('hist')!;
                        hList.add(_controller.text);
                        var h = Profilehist(name: _controller.text);
                        hist.add(h);
                        if (hList.length == 5) {
                          hList.removeAt(0);
                          hist.removeAt(0);
                        }
                        prefs.setStringList('hist', hList);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FriendProfileView(uid: q.docs[0].id)));
                        searchlist();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("User not found"),
                                content: Text("Please try again"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    },
                  ),
                ),
              )
            ],
          );
        });
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Color.fromRGBO(64, 118, 172, 1),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: AppColors.textcolor),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel_rounded),
                onPressed: () {
                  _controller.clear();
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Profilehist {
  late final String uid;
  final String name;
  late String avatarUrl =
      "https://i.pinimg.com/originals/1e/9c/b5/1e9cb54915d4c73e1ac2b4853bd9d89d.jpg";

  void initState() async {
    this.uid = await getuid();
    this.avatarUrl = await getUserImage();
  }

  String getAvatar() {
    return this.avatarUrl;
  }

  Profilehist({required this.name}) {
    initState();
  }

  Future<String> getUserImage() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(this.uid)
        .get();
    Map<String, dynamic> data = docSnapshot.data()!;
    return data['image'];
  }

  Future<String> getuid() async {
    QuerySnapshot q = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: this.name)
        .get();
    return q.docs[0].id;
  }
}
/*
class ProfileHist {
  final String name;
  final String route;
  final String avatarUrl;

  ProfileHist(
      {required this.name, required this.avatarUrl, required this.route});
}

List<ProfileHist> dummyHist = [
  ProfileHist(
    name: "i/susCity",
    avatarUrl: "https://pbs.twimg.com/media/EjJQLeLWkAE-RXF.jpg",
    route: "/profile",
  ),
  ProfileHist(
    name: "i/amiSUS",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJJmqSGd5IdcQuqo9UxLnw3GUQwnUqKXlUtQ&usqp=CAU",
    route: "/profile",
  ),
  ProfileHist(
    name: "i/beingImpostor",
    avatarUrl:
        "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    route: "/profile",
  ),
  ProfileHist(
    name: "i/areuSUS",
    avatarUrl:
        "https://i.pinimg.com/236x/db/b3/9d/dbb39d8f7713c3e160754de3bd709ca3.jpg",
    route: "/profile",
  ),
];
*/