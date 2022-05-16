class Demanda {
  final String? id;
  final String nome;
  final String descricao;
  final DateTime inicio;
  final DateTime fim;

  const Demanda(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.inicio,
      required this.fim});
}
