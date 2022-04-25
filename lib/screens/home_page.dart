// sempre se cria uma classe que vai dentro da classe StateFul
import 'package:app3d/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../settings/app_controller.dart';
import '../components/menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Aula Dispostivo Móvel'),
        actions: const [CustomSwitch()],
      ),
      body: const BottomNav(),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
