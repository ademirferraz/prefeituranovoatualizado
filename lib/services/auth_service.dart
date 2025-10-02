import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> login(String email, String senha) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return true;
    } catch (e) {
      print('Erro no login: $e');
      return false;
    }
  }

  static Future<bool> cadastrar(String email, String senha) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return true;
    } catch (e) {
      print('Erro no cadastro: $e');
      return false;
    }
  }
}

