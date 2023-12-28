class NewsModle{
  late String author;
  late String title;
  late String description;
  late String urlToImage;
  late String publishedAt;

  NewsModle({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,


  });
  NewsModle.fromJson(Map<String,dynamic>json){
    author = json['author'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    urlToImage = json['urlToImage'] ?? '';
    publishedAt = json['publishedAt'] ?? '';

  }


}