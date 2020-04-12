import 'package:http/http.dart';
import 'package:hyper_cord/rest/client.dart';
import 'package:hyper_cord/rest/thread.dart';
import 'package:hyper_cord/state/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

void fetchHomePagePostsMiddleware(Store<HypercordAppState> store, action, NextDispatcher next) {
  if (action is FetchMainPagePostsAction) {
    final client = ApiClient();

    client.getHomePagePosts().then((List<TThread> posts) {
      store.dispatch(new FetchMainPagePostsSucceededAction(posts));
    }).catchError((error) {
      print(error);
      store.dispatch(new FetchMainPagePostsFailedAction(error));
    });
  }

  next(action);
}