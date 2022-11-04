import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_page/pages/about_page.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/settings_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List<Widget> screens = [
      const HomePage(),
      const SettingsPage(),
      const AboutPage(),
    ];

    return BottomNavBar(currentIndex: currentIndex, screens: screens);
  }
}

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.screens,
  }) : super(key: key);

  int currentIndex;
  final List<Widget> screens;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Widget func({required Widget text}) {
      if (widget.currentIndex == 0) {
        return text = const Text(
          'Home',
          style: TextStyle(color: Colors.deepPurple),
        );
      } else if (widget.currentIndex == 1) {
        return text = const Text(
          'Settings',
          style: TextStyle(color: Colors.deepPurple),
        );
      }
      return text = const Text(
        'About',
        style: TextStyle(color: Colors.deepPurple),
      );
    }

    
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromARGB(239, 240, 111, 94),
        activeColor: Colors.deepPurple,
        gap: 10,
        curve: Curves.easeInCubic,
        padding: const EdgeInsets.all(20),
        selectedIndex: widget.currentIndex,
        onTabChange: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            iconColor: Colors.black38,
            text: 'Home',
          ),
          GButton(
            icon: Icons.settings,
            iconColor: Colors.black38,
            text: 'Settings',
          ),
          GButton(
            icon: Icons.person,
            iconColor: Colors.black38,
            text: 'About',
          ),
        ],
      ),
      appBar: AppBar(
          title: func(
            text: const Text(''),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber[200],
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.deepPurple,
                ))
          ]),
      body: widget.screens[widget.currentIndex],
    );
  }
}
