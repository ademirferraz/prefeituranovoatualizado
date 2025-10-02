import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico do Prefeito')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('historico_prefeito').orderBy('data', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final item = docs[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text(item['descricao']),
                subtitle: Text(item['data']),
              );
            },
          );
        },
      ),
    );
  }
}
