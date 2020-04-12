import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hyper_cord/Pages/MainPage.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

class HyperCordNavBar extends StatefulWidget {
  final Store<HypercordAppState> store;

  HyperCordNavBar(this.store);

  @override
  _HyperCordNavBarState createState() => _HyperCordNavBarState();
}

class _HyperCordNavBarState extends State<HyperCordNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return new StoreProvider(store: widget.store,
      child: StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, list) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
                key: _bottomNavigationKey,
                items: <Widget>[
                  Icon(FontAwesomeIcons.home, size: 25, color: Colors.red[700]),
                  Icon(
                    FontAwesomeIcons.newspaper,
                    size: 25,
                    color: Colors.red[700],
                  ),
                  Icon(FontAwesomeIcons.plus, size: 25, color: Colors.red[700]),
                  Icon(FontAwesomeIcons.cogs, size: 25, color: Colors.red[700]),
                  Icon(FontAwesomeIcons.user, size: 25, color: Colors.red[700]),
                ],
                height: 55,
                animationDuration: Duration(milliseconds: 250),
                animationCurve: Curves.easeIn,
                color: Color(0xff0f172d),
                backgroundColor: Color(0xff272E48),
                onTap: (int index) {
                  setState(() {
                    _page = index;
                    _pageController.jumpToPage(index);
                  });
                }),
            body: PageView(
              controller: _pageController,
              children: <Widget>[
                MainPage(widget.store),
                Scaffold(),
                Scaffold(),
                Scaffold(),
                Scaffold(),
              ],
              onPageChanged: (int index) {
                setState(() {
                  _pageController.jumpToPage(index);
                  final CurvedNavigationBarState navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState.setPage(index);
                });
              },
            ),
          );

        }
      )
    );
  }
}
