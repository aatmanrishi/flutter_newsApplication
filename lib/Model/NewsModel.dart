class NewsArticle {
  String status;
  int totalResults;
  List<Articles> articles;

  NewsArticle({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsArticle.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String? ?? 'Unknown',
        totalResults = json['totalResults'] as int? ?? 0,
        articles = (json['articles'] as List<dynamic>?)?.map((v) => Articles.fromJson(v)).toList() ?? [];

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((v) => v.toJson()).toList(),
    };
  }
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Articles.fromJson(Map<String, dynamic> json)
      : source = Source.fromJson(json['source']),
        author = json['author'] as String? ?? 'Unknown',
        title = json['title'] as String? ?? 'Unknown',
        description = json['description'] as String? ?? 'Unknown',
        url = json['url'] as String? ?? 'Unknown',
        urlToImage = json['urlToImage'] as String? ?? 'https://cdn.dribbble.com/users/101577/screenshots/4871767/hello-3-3.gif', // Default image URL
        publishedAt = json['publishedAt'] as String? ?? 'Unknown',
        content = json['content'] as String? ?? 'Unknown';

  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  @override
  String toString() {
    return 'Title: $title, Author: $author, Description: $description';
  }
}

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String? ?? 'Unknown', // Handle null
        name = json['name'] as String? ?? 'Unknown'; // Handle null

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Source: $name';
  }
}
