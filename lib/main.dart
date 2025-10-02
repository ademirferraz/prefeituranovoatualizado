import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Importações de telas
import 'screens/loading_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/menu_principal.dart';
import 'screens/servicos_screen.dart';
import 'screens/agendamento_screen.dart';
import 'screens/notificacoes_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/confirmacao_screen.dart';
import 'screens/historico_screen.dart';
import 'screens/editar_agendamento_screen.dart';
import 'screens/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInAnonymously(); // Login anônimo para testes
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prefeitura App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/menu': (context) => MenuPrincipal(),
        '/servicos': (context) => ServicosScreen(),
        '/agendamento': (context) => AgendamentoScreen(),
        '/notificacoes': (context) => NotificacoesScreen(),
        '/perfil': (context) => PerfilScreen(),
        '/confirmacao': (context) => ConfirmacaoScreen(),
        '/historico': (context) => HistoricoScreen(),
        '/editar': (context) => EditarAgendamentoScreen(),
        '/admin': (context) => AdminDashboard(),
      },
    );
  }
}

