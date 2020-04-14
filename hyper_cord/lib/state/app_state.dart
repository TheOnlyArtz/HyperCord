import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/rest/thread.dart';

class HypercordAppState {
  List<Article> homePageHeaderPosts;  
  List<TNode> homePageNodes;
  bool isFetching = false;
  dynamic error;

  HypercordAppState({
    this.homePageHeaderPosts,
    this.homePageNodes,
    this.isFetching = false,
    this.error
  });
}