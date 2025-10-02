import 'package:flutter/material.dart';

class ConfirmacaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmação')),
      body: Center(child: Text('Agendamento confirmado com sucesso!')),
    );
  }
}
