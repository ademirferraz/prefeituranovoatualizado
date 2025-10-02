class Protocolo {
  final String numero;
  final String status;
  final String descricao;

  Protocolo({required this.numero, required this.status, required this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'numero': numero,
      'status': status,
      'descricao': descricao,
    };
  }
}
