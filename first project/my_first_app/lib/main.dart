import 'package:flutter/material.dart';
import 'package:my_first_app/home_screen.dart';

import 'second_screen.dart';
import 'stack_screen.dart';

void main() {
  runApp(const MyApp());
}

// stateless widget = widget with no state
// stateful widget = widget with state

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enta',
      // home: const HomeScreen(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == SecondScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          );
        } else if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        } else if (settings.name == StackScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => const StackScreen(),
          );
        }

        return null; // Let `onUnknownRoute` handle this behavior.
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}
