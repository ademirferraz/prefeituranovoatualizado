import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CertidaoScreen extends StatelessWidget {
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  void emitirCertidao(BuildContext context) async {
    await FirebaseFirestore.instance.collection('certidoes').add({
      'tipo': tipoController.text,
      'nome': nomeController.text,
      'data': DateTime.now().toIso8601String(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Certidão emitida com sucesso')),
    );

    tipoController.clear();
    nomeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emitir Certidão')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: tipoController, decoration: InputDecoration(labelText: 'Tipo de Certidão')),
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome Completo')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => emitirCertidao(context),
              child: Text('Emitir'),
            ),
          ],
        ),
      ),
    );
  }
}
