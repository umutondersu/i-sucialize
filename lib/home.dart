import 'package:flutter/material.dart';
import 'package:i_sucialize/notifications.dart';
import 'package:i_sucialize/util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped (int index){
    setState((){
      _selectedIndex = index;
    });
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children:[
          Container(color:Colors.blue),
          Container(color:Colors.blue),
          Container(color:Colors.green),
          Container(color:Colors.white),
          NotificationsView(),
        ],
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