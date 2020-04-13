import 'package:hyper_cord/rest/article.dart';
import 'package:hyper_cord/rest/client.dart';
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
  }

  next(action);
}