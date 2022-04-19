// sempre se cria uma classe que vai dentro da classe StateFul
import 'package:app3d/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  String nome = 'Colors.green';
  @override
  Widget build(BuildContext context) {
    // podemos usar Scaffold ou material

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
