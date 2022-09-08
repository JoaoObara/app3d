import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  //Exceções
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance; //Verificar autentificação
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario =
          (user == null) ? null : user; // Verifica se existe um usuário ou não
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser; //Atribuir usuário
    notifyListeners(); // Notificar sobre ess usuário
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      //Exceção com descrição de erros do firebase
      if (e.code == 'weak-password') {
        throw AuthException('Senha muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já está em uso');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      //Exceção com descrição de erros do firebase
      if (e.code == 'user-not-found') {
        throw AuthException('Usuário não registrado');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    //Sair
    await _auth.signOut();
    _getUser();
  }
}
