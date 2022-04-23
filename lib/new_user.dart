import 'package:flutter/material.dart';

class newUser extends StatelessWidget {
  newUser({Key? key}) : super(key: key);

  String nome = "";
  String email = "";
  String senha = "";
  String valsenha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    //         NOME
                    onChanged: (text) => nome = text,
                    decoration: const InputDecoration(
                      labelText: 'Nome de Usuário',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 13),
                  TextField(
                    //          EMAIL
                    onChanged: (text) => email = text,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 13),
                  TextField(
                    //          SENHA
                    onChanged: (text) => senha = text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Nova Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 13),
                  TextField(
                    //          CONFIRMAR SENHA
                    onChanged: (text) => valsenha = text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Repita a senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            print('Criou o usuário');
                          },
                          icon: const Icon(Icons.send_outlined),
                          label: const Text('Criar'))
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
}
