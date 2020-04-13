import 'package:hyper_cord/rest/article.dart';

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