// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:i_sucialize/home.dart';
import 'package:i_sucialize/main.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/routes.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchPageAppBar(),
      body: SearchHistory(),
    );
  }

  // ignore: non_constant_identifier_names
  Scaffold SearchHistory() {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.backgroundcolor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColors.backgroundcolor2,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
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
            ),
          ),
          width: 350,
          height: 280,
        ),
      ),
      backgroundColor: AppColors.backgroundcolor,
    );
  }
}

class SearchPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.textcolor,
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.secondary,
      leadingWidth: 60,
      leading: TextButton(
        child: CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.network(
              "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
              fit: BoxFit.cover,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
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
              onPressed: () {},
            ),
          ),
        )
      ],
      centerTitle: true,
    );
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
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(64, 118, 172, 1),
              width: 0.1,
              style: BorderStyle.solid),
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
      ),
    );
  }
}

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
    avatarUrl:
        "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    route: "/profile",
  ),
  ProfileHist(
    name: "i/amiSUS",
    avatarUrl:
        "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
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
        "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
    route: "/profile",
  ),
];
