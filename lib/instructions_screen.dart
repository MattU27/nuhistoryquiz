import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  final Color nuBlue = Color(0xFF0038A8);
  final Color nuGold = Color(0xFFFFD700);
  final Color nuGold1 = Color(0xFFFF980C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nuBlue,
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [nuBlue, nuBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    instructionRow(
                      icon: Icons.check_circle,
                      text: 'Answer the questions correctly to earn points.',
                      fontSize: 17, // Adjusting font size
                    ),
                    instructionRow(
                      icon: Icons.lightbulb,
                      text: 'Trivia questions are displayed for correct answers.',
                      fontSize: 17, // Adjusting font size
                    ),
                    instructionRow(
                      icon: Icons.touch_app,
                      text: 'Tap your preferred answer choice.',
                      fontSize: 17, // Adjusting font size
                    ),
                    instructionRow(
                      icon: Icons.star,
                      text: 'Enjoy and learn!',
                      fontSize: 17, // Adjusting font size
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Add spacing between instructions and back button
              // Button to navigate back to the MenuScreen
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                child: Text(
                  'Back to Menu',
                  style: TextStyle(fontSize: 15, fontFamily: 'PressStart2P'), // Using the same fontFamily
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
      ),
    );
  }

  Widget instructionRow({required IconData icon, required String text, required double fontSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: nuBlue,
            size: 30,
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: nuBlue,
                fontFamily: 'PressStart2P', // Using the same fontFamily
              ),
            ),
          ),
        ],
      ),
    );
  }
}
