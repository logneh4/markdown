import './lib/markdown.dart';
void main() {
  final test = "k ~! _t_ est!~ k";
  // final test =  "lol ~~~ te__ds__dsst n wa~~~";
  // final test =  "lol <h1>___a___</h1>";
  // final test =  " lol ~!...!~ a`kana` <p align=\"left\">This is kind of pointless...</p> ![fallback text](https://anilist.co/img/icons/icon.svg) ~~~m   _b_  _ **a**a  \n # klock _    b ay\no~~~ b waaa";
   final parsed = markdownToHtml(
    test,
    );
    print(parsed);
}


