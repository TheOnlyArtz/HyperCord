import 'package:bbob_dart/bbob_dart.dart' as bbob;
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:link/link.dart';

class BBCodeCompiler {
  static List<bbob.Node> getAST(String bbcode) {
    // TODO: deal with attachments
    const validTags = {'b', 'url', "IMG", "B", "CENTER", "SIZE", "ATTACH", "URL"};
    return bbob.parse(bbcode, onError: (msg) {
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
        parseTagChildren(element.children, element.tag, element).forEach((elemen) {widgets.add(elemen);});
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
            WidgetSpan img = WidgetSpan(
              child: Image(
                image: AdvancedNetworkImage(
                  element.textContent,
                  useDiskCache: true,
                  cacheRule: CacheRule(maxAge: const Duration(days: 3)),
                ),
                fit: BoxFit.cover
              )
            );
            toReturn.add(img);
          // print(toReturn);
        } else {
          
          toReturn.add(TextSpan(text: element.textContent, style: TextStyle(color: Colors.white)));
        }
      }
    });

    return toReturn;
  }
}
