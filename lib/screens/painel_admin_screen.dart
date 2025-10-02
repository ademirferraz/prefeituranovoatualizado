import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/historico.dart';

class PainelAdminScreen extends StatelessWidget {
  final FirebaseService _service = FirebaseService();
  final TextEditingController descricaoController = TextEditingController();

  void adicionarHistorico(BuildContext context) async {
    final historico = Historico(
      descricao: descricaoController.text,
      data: DateTime.now().toIso8601String(),
    );
    await _service._db.collection('historico_prefeito').add(historico.toMap());
    descricaoController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Histórico adicionado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painel do Prefeito')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Nova ação realizada'),
            ),
          ),
          ElevatedButton(
            onPressed: () => adicionarHistorico(context),
            child: Text('Adicionar ao Histórico'),
          ),
          Expanded(
            child: StreamBuilder<List<Historico>>(
              stream: _service.listarHistorico(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                final historico = snapshot.data!;
                return ListView.builder(
                  itemCount: historico.length,
                  itemBuilder: (context, index) {
                    final item = historico[index];
                    return ListTile(
                      title: Text(item.descricao),
                      subtitle: Text(item.data),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
