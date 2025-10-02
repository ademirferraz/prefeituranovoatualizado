
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  Map<String, dynamic>? dados;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc = await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
      if (doc.exists) {
        setState(() => dados = doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: dados == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                  SizedBox(height: 20),
                  ListTile(leading: Icon(Icons.email), title: Text(dados!['email'])),
                  ListTile(leading: Icon(Icons.person), title: Text(dados!['nome'])),
                  ListTile(leading: Icon(Icons.phone), title: Text(dados!['telefone'])),
                  ListTile(leading: Icon(Icons.badge), title: Text(dados!['cpf'])),
                ],
              ),
            ),
    );
  }
}



