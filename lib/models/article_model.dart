class ArticalModel {
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;

  ArticalModel.fromMap(Map<String, dynamic> map) {
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    print(
        ' description: $description\n url:$url urlToImage:$urlToImage\n publishedAt:$publishedAt\n');
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }
}
