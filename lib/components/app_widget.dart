// import pacotes do flutter
import 'package:flutter/material.dart';
// import as classes do sistema
import '../screens/new_user.dart';
import '../perfil_page.dart';
import '../routes/app_routes.dart';
import '../screens/demanda.dart';
import '../screens/home_page.dart';
import '../screens/login_page.dart';
import '../settings/app_controller.dart';

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
          initialRoute: AppRoutes.login,
          routes: {
            AppRoutes.login: (_) => const LoginPage(),
            AppRoutes.home: (_) => const HomePage(),
            AppRoutes.perfilPage: (_) => const PerfilPage(),
            AppRoutes.newuser: (_) => newUser(),
            AppRoutes.consultarDemanda: (_) => const ConsultarDemanda()
          },
        );
      },
    );
  }
}

// primarySwatch: Colors.green,
// brightness: Brightness.dark,
