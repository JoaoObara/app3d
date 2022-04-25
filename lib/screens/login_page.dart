import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 90,
                    height: 50,
                  ),
                  Container(
                    height: 40,
                  ),
                  Card(
                    child: Padding(
                      //padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 5),

                      child: Column(
                        children: [
                          TextField(
                            onChanged: (text) => email = text,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email User',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (text) => senha = text,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/newUser');
                        },
                        child: const Text('esqueceu a senha?'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (email == 'root' && senha == 'root') {
                            Navigator.of(context).pushNamed('/home');
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // aqui ele empilha os componentes
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/AfterNoon.png',
            ),
          ),
          Container(color: Colors.black.withOpacity(0.36)),
          _body(),
        ],
      ),
    );
  }
}
