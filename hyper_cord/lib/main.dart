import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordNavBar.dart';
import 'package:hyper_cord/state/actions.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:hyper_cord/state/middleware.dart';
import 'package:hyper_cord/state/reducers.dart';
import 'package:redux/redux.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  final store = new Store<HypercordAppState>(
    appReducer,
    initialState: new HypercordAppState(),
    middleware: [fetchHomePagePostsMiddleware]
  );

  store.dispatch(FetchMainPagePostsAction());
  
  runApp(Pages(store));
}
class Pages extends StatefulWidget {
  final Store<HypercordAppState> store;

  Pages(this.store);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return StoreProvider(store: widget.store, 
    
      child: StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, data) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Assistant',
              primaryColor: Color.fromRGBO(39, 46, 72, 1),
            ),
            home: SplashScreen(
              seconds: 4,
              navigateAfterSeconds: HyperCordNavBar(widget.store),
              backgroundColor: Color(0xff272E48),
              loaderColor: Colors.red,
              image: Image.asset("assets/images/logo-big.gif", fit: BoxFit.fitWidth, ),
              photoSize: 180, 
              loadingText: Text(
                "...רק רגע",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.white
                )
              ),
            )
        // home: MainPage(),
          ); 
        } 
        
        )
    );
  }
}
