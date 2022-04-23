// import 'package:flutter/cupertino.dart';
import 'package:app3d/login_page.dart';
import 'package:app3d/new_user.dart';
import 'package:app3d/perfil_page.dart';
import 'package:flutter/material.dart';
// import a nova class gerada
import 'app_controller.dart';
import 'home_page.dart';

// fazer os imports

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // retiramos o atributo title
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(), //ARRUMAR Login
            '/home': (context) => const HomePage(),
            '/perfil': (context) => const PerfilPage(),
            '/newUser': (context) => newUser(),
          },
        );
      },
    );
  }
}

// primarySwatch: Colors.green,
// brightness: Brightness.dark,
