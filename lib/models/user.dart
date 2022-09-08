class User {
  final String? id;
  final String nome;
  final String email;
  final String senha;
  final String admin;

  const User(
      {required this.id,
      required this.nome,
      required this.email,
      required this.senha,
      required this.admin});
}