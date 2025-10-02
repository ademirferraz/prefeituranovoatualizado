import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painel da Prefeitura')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('agendamentos').orderBy('data', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final agendamento = docs[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(agendamento['servico']),
                  subtitle: Text('Nome: ${agendamento['nome']} | CPF: ${agendamento['cpf']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      agendamento.reference.delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
