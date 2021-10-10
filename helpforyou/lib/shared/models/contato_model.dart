class ContatoModel {
  final String nome;
  final String tel;

  ContatoModel({required this.nome, required this.tel});

  Map<String, dynamic> toMap() {
    return {"nome": this.nome, "tel": this.tel};
  }
}
