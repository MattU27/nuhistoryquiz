import 'package:flutter/material.dart';
import 'package:nuhistoryquiz/settings_screen.dart';
import 'package:nuhistoryquiz/about_screen.dart';
import 'package:nuhistoryquiz/game_categories_screen.dart';
import 'package:nuhistoryquiz/instructions_screen.dart'; // Import the InstructionsScreen

class MenuScreen extends StatelessWidget {
  final Color nuBlue = Color(0xFF0038A8);
  final Color nuGold = Color(0xFFFFD700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nuBlue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [nuBlue, nuGold],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'NU TimeWarp: History Quiz',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              MenuButton(
                text: 'Start Game',
                icon: Icons.play_arrow,
                color: nuBlue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameCategoriesScreen()),
                  );
                },
              ),
              MenuButton(
                text: 'Instructions', 
                icon: Icons.help,
                color: nuGold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstructionsScreen()),
                  );
                },
              ),
              MenuButton(
                text: 'Settings',
                icon: Icons.settings,
                color: nuBlue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
              MenuButton(
                text: 'About',
                icon: Icons.info,
                color: nuGold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  MenuButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
