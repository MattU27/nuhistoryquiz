import 'package:flutter/material.dart';
import 'package:nuhistoryquiz/menu_screen.dart';
import 'package:nuhistoryquiz/quiz_screen.dart';

final Color nuBlue = Color(0xFF0038A8);
final Color nuGold = Color(0xFFFFD700);

class GameCategoriesScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nuBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Choose Game Category',
                style: TextStyle(
                  fontSize: 18, // Adjust font size here
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'PressStart2P', // Change to your desired font family
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: nuGold,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  CategoryButton(
                    text: 'NU History',
                    color: Colors.white,
                    icon: Icons.history,
                    onPressed: () => _navigateToQuizScreen(context, 'NU History'),
                  ),
                  CategoryButton(
                    text: 'Famous Alumni',
                    color: Colors.white,
                    icon: Icons.person,
                    onPressed: () => _navigateToQuizScreen(context, 'Famous Alumni'),
                  ),
                  CategoryButton(
                    text: 'Campus Milestone', // Changed from 'Campus Milestones'
                    color: Colors.white,
                    icon: Icons.school,
                    onPressed: () => _navigateToQuizScreen(context, 'Campus Milestone'), // Changed from 'Campus Milestones'
                  ),
                  CategoryButton(
                    text: 'Legacy of NU',
                    color: Colors.white,
                    icon: Icons.star,
                    onPressed: () => _navigateToQuizScreen(context, 'Legacy of NU'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back to Menu',
                style: TextStyle(fontSize: 18, fontFamily: 'PressStart2P'), // Change to your desired font family
              ),
              style: ElevatedButton.styleFrom(
                primary: nuGold,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToQuizScreen(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen(category: category)),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryButton({required this.text, required this.color, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(15),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: nuBlue,
                size: 24,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18, // Adjust font size here
                  color: nuBlue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PressStart2P', // Using the same fontFamily as in SettingsScreen
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
