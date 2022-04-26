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
    return SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 180, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: const Color.fromARGB(111, 255, 184, 43),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
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
                          Row(
                            // Organizar o botão esqueceu a senha em linha
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: TextButton(
                                    onPressed: () {
                                      print('Alterar senha');
                                    },
                                    child: const Text(
                                      'esqueceu a senha?',
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    //Organizar os botões na linha
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/newUser');
                        },
                        child: const Text('Criar Conta'),
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          // aqui ele empilha os componentes
          SizedBox(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/AfterNoon.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.36)),
          _body(),
        ],
      ),
    );
  }
}
