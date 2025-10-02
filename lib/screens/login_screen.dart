import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'cadastro_screen.dart';
import 'menu_principal.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void _login() {
    bool sucesso = AuthService.login(emailController.text, senhaController.text);
    if (sucesso) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MenuPrincipal()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login inválido')),
      );
    }
  }

  void _irParaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CadastroScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            TextButton(
              onPressed: _irParaCadastro,
              child: Text('Não tem conta? Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}

