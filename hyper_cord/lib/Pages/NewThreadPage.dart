import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hyper_cord/Elements/HyperCordAppBar.dart';
import 'package:hyper_cord/rest/client.dart';
import 'package:hyper_cord/rest/thread.dart';
import 'package:hyper_cord/state/app_state.dart';
import 'package:redux/redux.dart';

import 'NewThreadForumSelectionPage.dart';

class NewThreadPage extends StatefulWidget {
  final Store<HypercordAppState> store;
  final Map<String, String> inputs = {};
  NewThreadPage(this.store);

  @override
  _NewThreadPageState createState() => _NewThreadPageState();
}

class _NewThreadPageState extends State<NewThreadPage> {
  TNode selectedForum;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<HypercordAppState, HypercordAppState>(
        converter: (store) => store.state,
        builder: (context, data) {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: CustomScrollView(
                slivers: <Widget>[
                  HyperCordBar(widget.store),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: GestureDetector(
                            onTap: () async {
                              if (widget.inputs.values.length != 3) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    backgroundColor: Colors.red[700],
                                    content: Text(
                                      "לא מילאת את כל הפרטים הדרושים!",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )));
                              } else { 
                                ApiClient client = ApiClient();
                                // TODO: as soon as we post a new thread, close the page, go to the home page or something
                                client.postNewThread(widget.inputs, selectedForum, null);
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red[700],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "פרסם את האשכול",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 27),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      dropDownForumMenu(widget.store, this, context),
                      textForm(this, "title", 2, "הכנס את כותרת האשכול", maxlength: 100),
                      textForm(this, "message", 8, "הכנס את תוכן האשכול"),
                    ]),
                  )
                ],
              ));
        });
  }
}

Widget dropDownForumMenu(
    Store<HypercordAppState> store, _NewThreadPageState newThreadPageState, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: GestureDetector(
      onTap: () async {
        TNode result = await Navigator.push(context, MaterialPageRoute(builder: (ctx) {return NewThreadForumSelectionPage(store);}));
        newThreadPageState.setState(() {
          newThreadPageState.selectedForum = result;
          newThreadPageState.widget.inputs["s"] = ""; // Just so it counts as a length
        });
      },
      child: Container(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 3.5),
            child: Stack(
              children: <Widget>[
                ClipRect(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff0f172d),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      newThreadPageState.selectedForum?.title != null ? newThreadPageState.selectedForum.title : "לחץ בכדי לבחור פורום",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    ),
  );
}

Widget textForm(
    _NewThreadPageState newThreadPageState, String key, int maxLines, String placeholder,
    {maxlength = 100}) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Container(
      child: Stack(
        children: <Widget>[
          TextField(
            maxLength: 10000,
            maxLines: maxLines,
            // expands: true,
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintText: placeholder,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                fillColor: Color(0xff0f172d),
                hoverColor: Colors.transparent),
            cursorColor: Colors.red[700],
            textDirection: TextDirection.ltr,

            onChanged: (String val) {
              newThreadPageState.widget.inputs[key] = val;

              if (val.length == 0) {
                newThreadPageState.widget.inputs.remove(key);
              }
            },
          ),
        ],
      ),
    ),
  );
}
