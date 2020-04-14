import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/rest/thread.dart';

class HypercordAppState {
  List<Article> homePageHeaderPosts;  
  List<TNode> homePageForums;
  bool isFetching = false;
  dynamic error;

  HypercordAppState({
    this.homePageHeaderPosts,
    this.homePageForums,
    this.isFetching = false,
    this.error
  });
}