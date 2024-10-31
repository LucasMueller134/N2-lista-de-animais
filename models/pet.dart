class Pet {
  String id;
  String nome;
  String descricao;

  Pet({required this.id, required this.nome, required this.descricao});

  factory Pet.fromMap(Map<String, dynamic> data, String documentId) {
    return Pet(
      id: documentId,
      nome: data['nome'] ?? '',
      descricao: data['descricao'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
    };
  }
}
