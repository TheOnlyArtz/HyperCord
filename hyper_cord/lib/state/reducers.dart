import 'package:hyper_cord/rest/thread.dart';
import 'package:hyper_cord/state/app_state.dart';

import 'actions.dart';

HypercordAppState appReducer(HypercordAppState state, dynamic action) {
  HypercordAppState newState = HypercordAppState();

  print(action);
  if (action is FetchMainPagePostsAction) {

    return new HypercordAppState(
      homePageHeaderPosts: state.homePageHeaderPosts,
      homePageNodes: state.homePageNodes, 
      isFetching: true,
      error: null // remove previous errors we might have
    );
  } else if (action is FetchMainPagePostsSucceededAction) {
    return new HypercordAppState(
      homePageHeaderPosts: action.fetchedPosts,
      homePageNodes: state.homePageNodes, 
      isFetching: false,
      // ensure no error exists
      error: null,
    );
  } else if (action is FetchMainPagePostsFailedAction) {
    return HypercordAppState(
      homePageHeaderPosts: const [],
      homePageNodes: state.homePageNodes, 
      isFetching: false,
      error: action.error // provice the UI with error
    );
  } else if (action is FetchMainPageNodesAction) {
    return new HypercordAppState(
      homePageHeaderPosts: state.homePageHeaderPosts,
      homePageNodes: state.homePageNodes, 
      isFetching: true,
      error: null // remove previous errors we might have
    );
  } else if (action is FetchMainPageNodesSucceededAction) {
    return new HypercordAppState(
      homePageHeaderPosts: state.homePageHeaderPosts,
      homePageNodes: action.fetchedNodes, 
      isFetching: false,
      error: null // remove previous errors we might have
    );
  } else if (action is FetchMainPageNodesFailedAction) {
    print(action.error);
    print("\n\n\n");
    return new HypercordAppState(
      homePageHeaderPosts: state.homePageHeaderPosts,
      homePageNodes: const [], 
      isFetching: false,
      error: action.error // remove previous errors we might have
    );
  }

  return newState;
}