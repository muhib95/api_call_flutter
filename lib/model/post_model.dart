class PostModel{
  final int id;
  final String title;
  final String body;
  PostModel({
    required this.id,
    required this.body,
    required this.title
});
factory PostModel.fromJson(Map<String,dynamic>p){
  return PostModel(id: p['id'], body: p['body'], title: p['title']);
}


}