import 'package:app3d/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  bool loading = false;

//Metodo login, chama o metodo login do provider "auth_service"
  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context) //Acontecerá em caso de erro
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 180, bottom: 8),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
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
                            controller: senha,
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
                            if (formKey.currentState!.validate()) {
                              // o formulário for válido ele irá tentar realizar o login
                              login();
                              isLogin = !isLogin;
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
    ));
  }
}
