// ignore_for_file: camel_case_types

class news1{
  final String id;
  final String title;
  final String content;
  final String date;
  final String author;
  final String image;

  news1({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.image

  });

  factory news1.fromJson(Map<String, dynamic> json){
    return news1(
        id: json['id'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        date: json['date'] as String,
        author: json['author'] as String,
        image: json['image'] as String,
    );
  }

}
class news2{
  final String id;
  final String title;
  final String content;
  final String date;
  final String author;
  final String image;

  news2({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.image

  });

  factory news2.fromJson(Map<String, dynamic> json){
    return news2(
        id: json['id'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        date: json['date'] as String,
        author: json['author'] as String,
        image: json['image'] as String,
    );
  }

}
// ignore: camel_case_types
class news3{
  final String id;
  final String title;
  final String content;
  final String date;
  final String author;
  final String image;

  news3({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.image

  });

  factory news3.fromJson(Map<String, dynamic> json){
    return news3(
        id: json['id'] as String,
        title: json['title'] as String,
        content: json['content'] as String,
        date: json['date'] as String,
        author: json['author'] as String,
        image: json['image'] as String,
    );
  }
}