import 'dart:convert';

import './lib/markdown.dart';
void main() {
  // final test = "k ~! _t_ est!~ k";
  // final test =  "lol ~~~ te__ds__dsst n wa~~~";
  final test =  "lol __a__ ds";
  // final test =  " lol ~!...!~ a`kana` <p align=\"left\">This is kind of pointless...</p> ![fallback text](https://anilist.co/img/icons/icon.svg) ~~~m   _b_  _ **a**a  \n # klock _    b ay\no~~~ b waaa";
  //  final parsed = markdownToHtml(
  //   test,
  //   );
  
    final Document document = Document(
      blockSyntaxes: ExtensionSet.ALFlavored.blockSyntaxes,
      inlineSyntaxes: ExtensionSet.ALFlavored.inlineSyntaxes,
      extensionSet: ExtensionSet.ALFlavored,
      encodeHtml: false,

    );
    // Parse the source Markdown data into nodes of an Abstract Syntax Tree.
    final List<String> lines = const LineSplitter().convert(test);
    final List<Node> astNodes = document.parseLines(lines);

    readNode(astNodes);
}



void readNode(List<Node> nodes) {
  for (final element in nodes) {
    print(element.accept(visitor));
  }
}
