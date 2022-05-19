class Article {
  int id;
  String title;
  String desc;
  String status;
  Article({
    required this.id,
    required this.title,
    required this.desc,
    required this.status,
  });
}

List<Article> listArticle = [
  Article(id: 1, title: "test", desc: "coba aja", status: 'published'),
  Article(id: 2, title: "ya gitu", desc: "coba aja", status: 'published'),
  Article(id: 3, title: "bisa aja", desc: "coba aja", status: 'published'),
  Article(id: 4, title: "coba coba", desc: "coba aja", status: 'published'),
];
