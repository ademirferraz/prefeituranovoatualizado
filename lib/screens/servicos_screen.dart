import 'package:flutter/material.dart';
import 'agendamento_screen.dart';
import 'certidao_screen.dart';
import 'protocolo_screen.dart';
import 'envio_midia_screen.dart';
import 'historico_screen.dart';
import 'painel_admin_screen.dart';

class ServicosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Serviços da Prefeitura')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Agendar Atendimento'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AgendamentoPage())),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Emitir Certidão'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CertidaoScreen())),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Consultar Protocolo'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProtocoloScreen())),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Enviar Foto/Vídeo'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EnvioMidiaScreen())),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Histórico do Prefeito'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HistoricoScreen())),
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Painel do Prefeito'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PainelAdminScreen())),
          ),
        ],
      ),
    );
  }
}
