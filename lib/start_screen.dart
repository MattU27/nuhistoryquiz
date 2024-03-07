import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for SystemNavigator

import 'package:nuhistoryquiz/settings_screen.dart';
import 'package:nuhistoryquiz/about_screen.dart';
import 'package:nuhistoryquiz/game_categories_screen.dart';
import 'package:nuhistoryquiz/instructions_screen.dart'; // Import the InstructionsScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuTimeWarp', // Set the title of your app
      home: StartScreen(),
      // Set the path to your icon file
      // Note: This assumes that your icon file is located in the assets directory
      // and its name is 'NuIcon.png'
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          size: 32, // Set the size of the icon
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  final Color nuGold1 = Color(0xFFFF980C);
  final Color nuGold2 = Color(0xFFFDE32C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [nuGold2, nuGold1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/NuLogo.png',
                    width: 250,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2072), // Hex color code for #1B2072
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('Play', Colors.white, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameCategoriesScreen()),
                      );
                    }),
                    buildButton('Tutorial', Colors.white, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstructionsScreen()),
                      );
                    }),
                    buildButton('About', Colors.white, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                    }),
                    buildButton('Settings', Colors.white, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()),
                      );
                    }),
                    buildButton('Exit', Colors.white, () {
                      SystemNavigator.pop(); // Close the app
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to create a button with custom label, color, and onPressed function
  Widget buildButton(String label, Color color, VoidCallback onPressed) {
    // Determine font color based on the button color
    Color fontColor = color == Colors.white ? Color(0xFF1e1e1e) : Colors.white;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              color: fontColor,
              fontFamily: 'PressStart2P',
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
