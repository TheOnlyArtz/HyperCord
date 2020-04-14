import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/rest/client.dart';
import 'package:hyper_cord/rest/thread.dart';
import 'package:hyper_cord/state/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

void fetchHomePagePostsMiddleware(Store<HypercordAppState> store, action, NextDispatcher next) {
  if (action is FetchMainPagePostsAction) {
    final client = ApiClient();

    client.getHomePagePosts().then((List<Article> posts) {
      store.dispatch(new FetchMainPagePostsSucceededAction(posts));
    }).catchError((error) {
      store.dispatch(new FetchMainPagePostsFailedAction(error));
    });

    store.dispatch(new FetchMainPageNodesAction());
    // Fetch HomePageForums
    // store.dispatch(FetchMainPageForumsAction);
  }

  if (action is FetchMainPageNodesAction) {
    final client = ApiClient();

    client.getHomePageNodes().then((List<TNode> nodes) {
      store.dispatch(new FetchMainPageNodesSucceededAction(nodes));
    }).catchError((err) {
      store.dispatch(new FetchMainPagePostsFailedAction(err));
    });
    // TODO
  }

  next(action);
}