import 'package:bbob_dart/bbob_dart.dart' as bbob;
import 'package:flutter/material.dart';
import 'package:link/link.dart';

class BBCodeCompiler {
  static List<bbob.Node> getAST(String bbcode) {
    const validTags = {'b', 'url', "IMG", "B", "CENTER", "SIZE", "ATTACH", "URL"};
    return bbob.parse(bbcode, onError: (msg) {
      print(msg);
    },
        openTag: "[",
        closeTag: "]",
        enableEscapeTags: false,
        validTags: validTags);
  }

  static RichText compile(List<bbob.Node> ast) {
    // print(ast);
    // ast.forEach((node) => print(node.textContent));
    List<InlineSpan> widgets = [];

    ast.forEach((element) {
      if (element is bbob.Element) {
        // if (element.tag.toLowerCase() == "center") {
        widgets = parseTagChildren(element.children, element.tag, element);
        // }
      } else {
        widgets.add(TextSpan(text: element.textContent));
      }
    });

    return RichText(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      text: TextSpan(
          style: TextStyle(
              color: Colors.white, fontFamily: "OpenSansHebrew", fontSize: 18),
          children: <InlineSpan>[...widgets]),
    );
  }

  static List<InlineSpan> parseTagChildren(List<bbob.Node> nodes, String tag, bbob.Element prevElement) {
    List<InlineSpan> toReturn = List<InlineSpan>();

    nodes.forEach((element) {
      if (element is bbob.Element) {
        // print(element.tag);
        parseTagChildren(element.children, element.tag, element).forEach((el) {
          toReturn.add(el);
        });
      } else {
        if (tag == "B") {
          toReturn.add(TextSpan(
              text: element.textContent,
              style: TextStyle(fontWeight: FontWeight.bold)));
        } else if (tag == "IMG") {
          toReturn.add(WidgetSpan(
              child: Image.network(
            element.textContent,
            width: double.infinity,
          )));
          // print(toReturn);
        } else {
          print(prevElement.attributes);
          toReturn.add(TextSpan(text: element.textContent));
        }
      }
    });

    return toReturn;
  }
}
