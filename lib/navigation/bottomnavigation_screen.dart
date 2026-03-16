import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_assignment/screens/chat_screen.dart';
import 'package:instagram_clone_assignment/screens/home_feed_screen.dart';
import 'package:instagram_clone_assignment/screens/profile_screen.dart';
import 'package:instagram_clone_assignment/screens/reels_screen.dart';
import 'package:instagram_clone_assignment/screens/search_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeFeedScreen(),
    const ReelsScreen(),
    const ChatScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,

        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        items: const [

          /// HOME
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, size: 24),
            label: "",
          ),

          /// REELS
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.clapperboard, size: 22),
            label: "",
          ),

          /// MESSAGE
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.paperPlane, size: 22),
            label: "",
          ),

          /// SEARCH
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
            label: "",
          ),

          /// PROFILE
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 13,
              backgroundImage: AssetImage("assets/images/sarthak.jpg"),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}