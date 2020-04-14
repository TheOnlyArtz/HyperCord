import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/rest/thread.dart';

class FetchMainPagePostsAction {
}

class FetchMainPagePostsSucceededAction {
  final List<Article> fetchedPosts;

  FetchMainPagePostsSucceededAction(this.fetchedPosts);
}

class FetchMainPagePostsFailedAction {
  final dynamic error;
  FetchMainPagePostsFailedAction(this.error);
}

class FetchMainPageNodesAction {

}

class FetchMainPageNodesSucceededAction {
  final List<TNode> fetchedNodes;

  FetchMainPageNodesSucceededAction(this.fetchedNodes);
}

class FetchMainPageNodesFailedAction {
  final dynamic error;

  FetchMainPageNodesFailedAction(this.error);
}