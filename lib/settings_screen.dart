import 'package:flutter/material.dart';
import 'package:nuhistoryquiz/menu_screen.dart';

final Color nuBlue = Color(0xFF0038A8);
final Color nuGold = Color(0xFFFFD700);

class SettingsScreen extends StatelessWidget {
  // Define the colors for the National University Philippines theme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a gradient background to create a modern look
      backgroundColor: nuBlue,
      body: Container(
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
              // Use a custom font and a drop shadow for the title
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
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
              // Use a custom widget to create the settings options with icons and switches
              SettingsOption(
                text: 'Sound Effects',
                icon: Icons.volume_up,
                color: nuGold,
                value:
                    true, // TODO: Use a state variable to store the value of the switch
                onChanged: (bool value) {
                  // TODO: Implement the logic to enable or disable sound effects
                },
              ),
              SettingsOption(
                text: 'Dark Mode',
                icon: Icons.dark_mode,
                color: nuGold,
                value:
                    false, // TODO: Use a state variable to store the value of the switch
                onChanged: (bool value) {
                  // TODO: Implement the logic to switch between light and dark mode
                },
              ),
              SettingsOption(
                text: 'Notifications',
                icon: Icons.notifications,
                color: nuGold,
                value:
                    true, // TODO: Use a state variable to store the value of the switch
                onChanged: (bool value) {
                  // TODO: Implement the logic to enable or disable notifications
                },
              ),
              // Use a custom widget to create a back button to return to the menu screen
              MenuButton(
                text: 'Back',
                color: nuGold,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A custom widget to create the settings options with rounded corners and icons
class SettingsOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  SettingsOption({
    required this.text,
    required this.icon,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
            size: 24,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: nuBlue,
              fontWeight: FontWeight.bold,
              fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: nuBlue,
            inactiveThumbColor: nuGold,
          ),
        ),
      ),
    );
  }
}

// A custom widget to create a button for the menu screen
class MenuButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  MenuButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'PressStart2P', // Using the same fontFamily as StartScreen
                color: Colors.black, // Set text color to black
              ),
            ),
          ),
        ),
      ),
    );
  }
}
