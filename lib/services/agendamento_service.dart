import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/agendamento.dart';

class AgendamentoService {
  static Future<void> salvarAgendamento(Agendamento agendamento) async {
    await FirebaseFirestore.instance.collection('agendamentos').add(agendamento.toMap());
  }
}
