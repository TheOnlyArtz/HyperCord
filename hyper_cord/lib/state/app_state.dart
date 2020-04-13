import 'package:hyper_cord/rest/article.dart';

class HypercordAppState {
  List<Article> homePageHeaderPosts;  
  bool isFetching = false;
  dynamic error;

  HypercordAppState({
    this.homePageHeaderPosts,
    this.isFetching = false,
    this.error
  });
}