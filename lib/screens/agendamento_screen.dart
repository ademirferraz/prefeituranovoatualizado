import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgendamentoScreen extends StatefulWidget {
  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen> {
  String? servicoSelecionado;
  final dataController = TextEditingController();
  final horarioController = TextEditingController();

  Future<void> salvarAgendamento() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null && servicoSelecionado != null) {
      await FirebaseFirestore.instance.collection('agendamentos').add({
        'uid': uid,
        'servico': servicoSelecionado,
        'data': dataController.text,
        'horario': horarioController.text,
        'criado_em': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Agendamento salvo com sucesso')),
      );

      dataController.clear();
      horarioController.clear();
      setState(() => servicoSelecionado = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agendamentos')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: servicoSelecionado,
              items: ['Documentos', 'Atendimento Social']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (val) => setState(() => servicoSelecionado = val),
              hint: Text('Escolha o serviço'),
            ),
            TextField(
              controller: dataController,
              decoration: InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: horarioController,
              decoration: InputDecoration(labelText: 'Horário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null && servicoSelecionado != null) {
      await FirebaseFirestore.instance.collection('agendamentos').add({
        'uid': uid,
        'servico': servicoSelecionado,
        'data': '27/09/2025', // substitua por campo real
        'horario': '10:00',   // substitua por campo real
        'criado_em': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Agendamento salvo com sucesso')),
      );
    }
  },
  child: Text('Confirmar'),
)

