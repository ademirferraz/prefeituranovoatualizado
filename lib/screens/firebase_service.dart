import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> salvarAgendamento(Map<String, dynamic> dados) async {
    await _db.collection('agendamentos').add(dados);
  }

  Stream<QuerySnapshot> listarAgendamentos() {
    return _db.collection('agendamentos').snapshots();
  }
}
