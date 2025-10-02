class Historico {
  final String descricao;
  final String data;

  Historico({required this.descricao, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'data': data,
    };
  }
}
