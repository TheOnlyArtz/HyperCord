import 'package:flutter/material.dart';
import 'package:hyper_cord/rest/thread.dart';

class HypercordAppState {
  List<TThread> homePageHeaderPosts;  
  bool isFetching = false;
  Exception error;

  HypercordAppState({
    this.homePageHeaderPosts,
    this.isFetching = false,
    this.error
  });
}