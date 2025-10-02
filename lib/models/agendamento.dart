class Agendamento {
  final String servico;
  final String data;
  final String horario;
  final String uid;

  Agendamento({
    required this.servico,
    required this.data,
    required this.horario,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'servico': servico,
      'data': data,
      'horario': horario,
      'uid': uid,
    };
  }
}
