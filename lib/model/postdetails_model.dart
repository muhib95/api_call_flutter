import 'dart:convert';

class PostdetailsModel{
  final int id;
  final String title;
  final String body;
  final Reacton reaction;
  PostdetailsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.reaction
});

  factory PostdetailsModel.fromJson(Map<String,dynamic>p){
    return PostdetailsModel(id: p['id'], title: p['title'], body: p['body'],
        reaction: Reacton.fromJson(p['reactions'])
    );
  }

}


class Reacton{
  final int likes;
  final int dislikes;
  Reacton({
     required this.likes,
     required this.dislikes
});

  factory Reacton.fromJson(Map<String,dynamic>json){
return Reacton(likes: json['likes'], dislikes: json['dislikes']);
  }
}