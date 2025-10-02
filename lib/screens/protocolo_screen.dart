import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProtocoloScreen extends StatelessWidget {
  final TextEditingController protocoloController = TextEditingController();

  void consultarProtocolo(BuildContext context) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('protocolos')
        .where('numero', isEqualTo: protocoloController.text)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final dados = snapshot.docs.first.data();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Protocolo Encontrado'),
          content: Text('Status: ${dados['status']}\nDescrição: ${dados['descricao']}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Protocolo não encontrado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultar Protocolo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: protocoloController, decoration: InputDecoration(labelText: 'Número do Protocolo')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => consultarProtocolo(context),
              child: Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}
