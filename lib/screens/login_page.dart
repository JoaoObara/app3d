import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  Widget _body() {
    return SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 180, bottom: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: const Color.fromARGB(111, 255, 184, 43),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              validator: Validatorless.multiple([
                                Validatorless.email('E-mail inválido'),
                                Validatorless.required('Informe o e-mail')
                              ]),
                              decoration: const InputDecoration(
                                labelText: 'Email User',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _senha,
                              validator: Validatorless.multiple([
                                Validatorless.min(6, '6 caracteres ou mais'),
                                Validatorless.required('Informe a senha'),
                              ]),
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
                            var formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              //Chamar controller para salvar os dados
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
