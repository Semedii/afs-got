class Prompt {
  final String reponse;
  final bool isFavorite;

  Prompt({required this.reponse, required this.isFavorite});


  factory Prompt.fromSqfliteDatabase(Map<String, dynamic> map){
    return Prompt(reponse: map['response']??'', isFavorite: map['isFavorite']?? false);
  }
}
