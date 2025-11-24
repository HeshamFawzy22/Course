import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_first_app/row_screen.dart';
import 'package:my_first_app/stack_screen.dart';

import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const RowScreen(),
    const SecondScreen(),
    const StackScreen(),
  ];

  List<String> titles = [
    'Row Screen',
    'Second Screen',
    'Stack Screen',
  ];
  Future<String> textWelcome = Future.value('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              // Action when button is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Notifications clicked'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              // Action when button is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Search clicked'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: screens[currentIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getWelcome().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value),
                duration: Duration(seconds: 1),
              ),
            );
          }).catchError((error) {
            log('Error: $error');
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Future<String> getWelcome() async {
    return 'Welcome Flutter';
  }
}
