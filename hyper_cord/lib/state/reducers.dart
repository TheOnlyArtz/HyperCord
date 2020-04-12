import 'package:flutter/cupertino.dart';
import 'package:hyper_cord/rest/thread.dart';
import 'package:hyper_cord/state/app_state.dart';

import 'actions.dart';

HypercordAppState appReducer(HypercordAppState state, dynamic action) {
  HypercordAppState newState = HypercordAppState();
  if (action is FetchMainPagePostsAction) {
    return new HypercordAppState(
      homePageHeaderPosts: state.homePageHeaderPosts,
      isFetching: true,
      error: null // remove previous errors we might have
    );
  } else if (action is FetchMainPagePostsSucceededAction) {
    return new HypercordAppState(
      homePageHeaderPosts: action.fetchedPosts,
      isFetching: false,
      // ensure no error exists
      error: null,
    );
  } else if (action is FetchMainPagePostsFailedAction) {
    return HypercordAppState(
      homePageHeaderPosts: const [],
      isFetching: false,
      error: action.error // provice the UI with error
    );
  }

  return newState;
}