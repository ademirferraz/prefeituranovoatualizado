import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/agendamento.dart';
import '../models/certidao.dart';
import '../models/protocolo.dart';
import '../models/historico.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> salvarAgendamento(Agendamento agendamento) async {
    await _db.collection('agendamentos').add(agendamento.toMap());
  }

  Future<void> emitirCertidao(Certidao certidao) async {
    await _db.collection('certidoes').add(certidao.toMap());
  }

  Future<Protocolo?> consultarProtocolo(String numero) async {
    final snapshot = await _db.collection('protocolos').where('numero', isEqualTo: numero).get();
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      return Protocolo(
        numero: data['numero'],
        status: data['status'],
        descricao: data['descricao'],
      );
    }
    return null;
  }

  Stream<List<Historico>> listarHistorico() {
    return _db.collection('historico_prefeito').orderBy('data', descending: true).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) {
        final data = doc.data();
        return Historico(descricao: data['descricao'], data: data['data']);
      }).toList(),
    );
  }
}
