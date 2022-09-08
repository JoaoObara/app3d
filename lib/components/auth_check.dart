import 'package:app3d/auth_services.dart';
import 'package:app3d/screens/home_page.dart';
import 'package:app3d/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth =
        Provider.of<AuthService>(context); //Acesso ao provider de autenticação

    if (auth.isLoading) //Verifica se foi carregado
      return loading();
    else if (auth.usuario ==
        null) // Se usuário for vazio ele irá para a teka de login
      return LoginPage();
    else //Se não ele irá para a homepage
      return HomePage();
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
