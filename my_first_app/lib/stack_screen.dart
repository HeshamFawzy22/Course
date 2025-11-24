import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  static const String routeName = 'stack';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/couple-making-heart-from-hands-sea-shore_23-2148019887.jpg?semt=ais_hybrid&w=740&q=80')),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                color: Colors.green.withAlpha(150),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.blue.withAlpha(150),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                color: Colors.yellow.withAlpha(150),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                color: Colors.white.withAlpha(150),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
