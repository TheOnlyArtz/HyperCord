
class Article {
  int id;
  int categoryId;
  int userId;
  String state;
  String message;
  int publishDate;
  int reactionScore;
  int coverImageId;
  String title;
  String username;
  String thumbnailUrl;

  // Article.fromJson(Map<String, dynamic> json) {
  //   id = json["article_id"]
  // }

  Article.fromList(dynamic list) {
    id = list[0];
    categoryId = list[1];
    userId = list[2];
    state = list[3];
    message = list[4].toString();
    publishDate = list[5];
    reactionScore = list[6];
    coverImageId = list[7];
    title = list[8];
    username = list[9];
  }

  void setThumbnailUrl(String url) {
    this.thumbnailUrl = url;
  }
}

class ArticleComment {
  int id;
  int articleId;
  String username;
  String message;
  int commentPublishDate;

  ArticleComment.fromList(List<dynamic> list) { 
    id = list[0];
    articleId = list[1];
    username = list[2];
    message = list[3];
    commentPublishDate = list[4];
  }
}