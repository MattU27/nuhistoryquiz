import 'package:flutter/material.dart';
import 'package:nuhistoryquiz/instructions_screen.dart';

class AboutScreen extends StatelessWidget {
  // Define the colors for the National University Philippines theme
  final Color nuBlue = Color(0xFF0038A8);
  final Color nuGold = Color(0xFFFFD700);
  final Color nuGold1 = Color(0xFFFFD700);
  final double fontSize = 15; // Define default font size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a gradient background to create a modern look
      backgroundColor: nuBlue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [nuBlue, nuBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Use custom descriptions to provide information about the game
                  AboutInfo(
                    text:
                        'NU TimeWarp: History Quiz is an engaging app designed to test your knowledge of National University Philippines\' rich history.',
                    icon: Icons.info,
                    color: Colors.white,
                    textColor: nuBlue,
                    fontSize: fontSize,
                  ),
                  AboutInfo(
                    text:
                        'Explore various categories, learn interesting facts, and challenge yourself with trivia questions.',
                    icon: Icons.info,
                    color: Colors.white,
                    textColor: nuBlue,
                    fontSize: fontSize,
                  ),
                  AboutInfo(
                    text: 'Discover the legacy of NU and have fun while doing it!',
                    icon: Icons.info,
                    color: Colors.white,
                    textColor: nuBlue,
                    fontSize: fontSize,
                  ),
                  SizedBox(height: 20), // Add spacing between descriptions and team info

                  // Container to style the "About Us" section
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white, // Blend with background
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: nuBlue,
                            fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'We are a team of passionate developers dedicated to creating educational and engaging mobile applications. Our goal is to provide users with a fun and interactive way to learn about National University Philippines\' rich history.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: nuBlue,
                            fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
                          ),
                        ),
                        SizedBox(height: 20), // Add spacing between team names and about us
                        // Display group member names
                        GroupMemberName(name: 'Anthony Esteban Jr.', fontSize: fontSize),
                        GroupMemberName(name: 'Gerard Misa', fontSize: fontSize),
                        GroupMemberName(name: 'Harvin Escoto', fontSize: fontSize),
                        GroupMemberName(name: 'Edgardo Refuerzo Jr.', fontSize: fontSize),
                        GroupMemberName(name: 'John Matthew S. Banto', fontSize: fontSize),
                      ],
                    ),
                  ),
                  SizedBox(height: 30), // Add spacing before the button
                  // Button to navigate back to the MenuScreen, styled similarly to InstructionScreen
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    child: Text(
                      'Back to Menu',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'PressStart2P', // Using the same fontFamily
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: nuGold, // Use NU Gold color for the button
                      onPrimary: Colors.black, // Text color when button is NU Gold
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A custom widget to create the about information with rounded corners and icons
class AboutInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;
  final double fontSize;

  AboutInfo({
    required this.text,
    required this.icon,
    required this.color,
    this.textColor = Colors.white,
    this.fontSize = 16.0, // Default font size
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
            ),
          ),
        ),
      ),
    );
  }
}

// A custom widget to display group member names
class GroupMemberName extends StatelessWidget {
  final String name;
  final double fontSize;

  GroupMemberName({required this.name, this.fontSize = 18.0}); // Default font size

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.blue, // Change color or apply any other style as needed
          fontWeight: FontWeight.bold, // Add bold styling
          fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
        ),
      ),
    );
  }
}
