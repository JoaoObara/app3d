import 'package:app3d/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            // ClipOval(child: ...)
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://avatars.githubusercontent.com/u/89274906?v=4'),
            ),
            accountName: const Text('João'),
            accountEmail: const Text('joao@gmail.com'),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              }),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.perfilPage);
              }),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Exit"),
              //subtitle: Text('Pagina inicial'),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.login);
              }),
        ],
      ),
    );
  }
}
