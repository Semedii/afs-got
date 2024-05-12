import 'package:afs_gpt/screens/favorite_page.dart';
import 'package:afs_gpt/screens/history_page.dart';
import 'package:afs_gpt/service/login_service.dart';
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
            _buildButton(title:  "History", iconData:  Icons.history, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryPage()));
            }),
            _buildButton(title: "Favorites",  iconData: Icons.favorite, onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoritePage()));
            }),
            _buildButton(title: "Logout",  iconData: Icons.exit_to_app, onTap: _logout),
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

  ListTile _buildButton({required String title, required IconData iconData, required Function() onTap}) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _logout(){
    LoginService().logout();
  }
}
