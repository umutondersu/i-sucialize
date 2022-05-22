import 'package:flutter/material.dart';
import 'package:i_sucialize/feed.dart';
import 'package:i_sucialize/notifications.dart';
import 'package:i_sucialize/profile.dart';
import 'package:i_sucialize/search.dart';
import 'package:i_sucialize/util/colors.dart';
import 'package:i_sucialize/walkthrough.dart';
import 'package:i_sucialize/post.dart';
import 'package:i_sucialize/chat_main.dart';

class HomeScreen extends StatefulWidget {
  int index = 0;
  HomeScreen({Key? key}) : super(key: key);
  HomeScreen.asindex(int index) {
    this.index = index;
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState.asindex(this.index);
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  PageController? pageController = null;

  _HomeScreenState() {
    pageController = PageController(initialPage: 0);
  }
  _HomeScreenState.asindex(index) {
    _selectedIndex = index;
    pageController = PageController(initialPage: _selectedIndex);
  }


  void onTapped (int index){
    setState((){
      _selectedIndex = index;
    });
    pageController?.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children:[
          FeedView(),
          SearchView(),
          PostView(),
          ChatView(),
          NotificationsView(),
        ],
        onPageChanged: onPageChange,
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "")

      ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.textcolor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTapped,
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}