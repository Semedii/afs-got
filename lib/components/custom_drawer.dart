import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            _buildDrawerHeader(),
            _buildButton("History", Icons.history),
            _buildButton("Favorites", Icons.favorite),
            _buildButton("Logout", Icons.exit_to_app),
          ],
        ),
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return const DrawerHeader(
        child: Text(
      'Welcome, to GPT',
      style: TextStyle(
        fontSize: 20,
      ),
    ));
  }

  ListTile _buildButton(String title, IconData iconData) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: () {},
    );
  }
}
