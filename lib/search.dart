// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:i_sucialize/util/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Icon(
                        Icons.circle,
                        color: AppColors.textcolor,
                        size: 15,
                      ),
                      Text(
                        ' i/susTown',
                        style: TextStyle(
                          color: AppColors.textcolor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.textcolor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Icon(
                        Icons.circle,
                        color: AppColors.textcolor,
                        size: 15,
                      ),
                      Text(
                        ' i/susCity',
                        style: TextStyle(
                          color: AppColors.textcolor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.textcolor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Icon(
                        Icons.circle,
                        color: AppColors.textcolor,
                        size: 15,
                      ),
                      Text(
                        ' i/amiSUS',
                        style: TextStyle(
                          color: AppColors.textcolor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.textcolor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Icon(
                        Icons.circle,
                        color: AppColors.textcolor,
                        size: 15,
                      ),
                      Text(
                        ' i/beingImpostor',
                        style: TextStyle(
                          color: AppColors.textcolor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: AppColors.textcolor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Icon(
                        Icons.circle,
                        color: AppColors.textcolor,
                        size: 15,
                      ),
                      Text(
                        ' i/areuSUS',
                        style: TextStyle(
                          color: AppColors.textcolor,
                        ),
                      ),
                      IconButton(
                        alignment: AlignmentDirectional.centerEnd,
                        icon: Icon(
                          Icons.remove,
                          color: AppColors.textcolor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            width: 350,
            height: 250,
          ),
        ),
        backgroundColor: AppColors.backgroundcolor);
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
      leadingWidth: 80,
      leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            child: CircleAvatar(
              radius: 100,
              child: ClipOval(
                child: Image.network(
                  "https://static.wikia.nocookie.net/amogus/images/c/cb/Susremaster.png/revision/latest/scale-to-width-down/1200?cb=20210806124552",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onPressed: () {},
          )),
      title: SearchBar(),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(64, 118, 172, 1), width: 4),
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
