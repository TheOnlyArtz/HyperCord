import 'package:hyper_cord/rest/thread.dart';

class FetchMainPagePostsAction {
}

class FetchMainPagePostsSucceededAction {
  final List<TThread> fetchedPosts;

  FetchMainPagePostsSucceededAction(this.fetchedPosts);
}

class FetchMainPagePostsFailedAction {
  final Exception error;
  FetchMainPagePostsFailedAction(this.error);
}