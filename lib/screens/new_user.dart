// ignore_for_file: prefer_const_constructors

import 'package:app3d/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../auth_services.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final valsenha = TextEditingController();

  bool loading = false;

  //Metodo login, chama o metodo login do provider "auth_service"
  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context) //Acontecerá em caso de erro
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    senha.dispose();
    valsenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  //         NOME
                  controller: nome,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o nome'),
                    Validatorless.min(3, 'Mínimo três letras')
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Nome de Usuário',
                  ),
                ),
                TextFormField(
                  //          EMAIL
                  controller: email,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o e-mail'),
                    Validatorless.email('E-mail inválido')
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                TextFormField(
                  //          SENHA
                  controller: senha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe a senha'),
                    Validatorless.min(6, 'Mínimo 6 caracteres')
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Nova Senha',
                  ),
                ),
                TextFormField(
                  //          CONFIRMAR SENHA
                  controller: valsenha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe a senha'),
                    Validatorless.min(6, 'Mínimo 6 caracteres'),
                    Validators.compare(
                        senha, 'Confirmação incorreta') //validação customizada
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Repita a senha',
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        //Chamar controller para salvar os dados
                        Navigator.of(context).pushNamed('/home');
                        registrar();
                      }
                    },
                    icon: const Icon(Icons.send_outlined),
                    label: const Text('Criar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
