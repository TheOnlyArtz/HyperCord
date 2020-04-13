
import 'package:intl/intl.dart';

class Article {
  int id;
  int categoryId;
  int userId;
  String state;
  String message;
  String publishDate;
  int reactionScore;
  int coverImageId;
  String title;
  String username;
  String thumbnailUrl;
  int viewCount;
  // Article.fromJson(Map<String, dynamic> json) {
  //   id = json["article_id"]
  // }

  Article.fromList(dynamic list) {
    id = list[0];
    categoryId = list[1];
    userId = list[2];
    state = list[3];
    message = list[4].toString();
    
    var format = DateFormat("dd/MM/yyyy HH:mm");
    var date =  new DateTime.fromMillisecondsSinceEpoch(list[5] * 1000);

    publishDate = format.format(date).toString();
    reactionScore = list[6];
    coverImageId = list[7];
    title = list[8];
    username = list[9];
    viewCount = list[10];
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