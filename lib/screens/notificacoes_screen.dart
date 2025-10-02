import 'package:flutter/material.dart';

class NotificacoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notificações')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text('Feira livre será transferida para sábado'),
            subtitle: Text('Publicado em 25/09/2025'),
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Interdição da Rua XV de Novembro'),
            subtitle: Text('Publicado em 24/09/2025'),
          ),
        ],
      ),
    );
  }
}

