class Certidao {
  final String tipo;
  final String nome;
  final String data;

  Certidao({required this.tipo, required this.nome, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'data': data,
    };
  }
}


