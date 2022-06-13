class User {
  final String? id;
  final String nome;
  final String descricao;
  final String? status;
  final String inicio;
  final String fim;

  const User(
      {required this.id,
      required this.nome,
      required this.descricao,
      required this.status,
      required this.inicio,
      required this.fim});
}
