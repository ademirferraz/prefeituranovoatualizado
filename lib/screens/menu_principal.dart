import 'package:flutter/material.dart';
import 'servicos_screen.dart';
import 'agendamento_screen.dart';
import 'notificacoes_screen.dart';
import 'perfil_screen.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    ServicosScreen(),
    AgendamentoPage(),
    NotificacoesScreen(),
    PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Agendar'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Avisos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
