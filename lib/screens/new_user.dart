// ignore_for_file: prefer_const_constructors

import 'package:app3d/validators.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _valsenha = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _email.dispose();
    _senha.dispose();
    _valsenha.dispose();
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
                  controller: _nome,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o nome'),
                    Validatorless.min(3, 'Mínimo três letras')
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Nome de Usuário',
                  ),
                ),
                const SizedBox(height: 13),
                TextFormField(
                  //          EMAIL
                  controller: _email,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o e-mail'),
                    Validatorless.email('E-mail inválido')
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 13),
                TextFormField(
                  //          SENHA
                  controller: _senha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe a senha'),
                    Validatorless.min(6, 'Mínimo 6 caracteres')
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Nova Senha',
                  ),
                ),
                const SizedBox(height: 13),
                TextFormField(
                  //          CONFIRMAR SENHA
                  controller: _valsenha,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe a senha'),
                    Validatorless.min(6, 'Mínimo 6 caracteres'),
                    Validators.compare(
                        _senha, 'Confirmação incorreta') //validação customizada
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
                        print('Criou o usuário');
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
