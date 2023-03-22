import '../inline_syntaxes/inline_syntax.dart';
import '../inline_parser.dart';
import '../block_syntaxes/block_syntax.dart';
import '../block_parser.dart';
import '../ast.dart';
import '../line.dart';
import '../util.dart';
import '../patterns.dart';
import '../line.dart';
import '../block_syntaxes/list_syntax.dart';


class ImageWithSizeSyntax extends InlineSyntax {

  ImageWithSizeSyntax()
      : super(r'(?:img)(\d{0,3})?\((http(?:s)?:\/\/[^\)]+)\)');

  @override
  bool onMatch(InlineParser parser, Match match) {
    String size = match.group(1) ?? "";
    String url = match.group(2) ?? "";

    Element img = Element('img', [Text("")]);

    if (size != null && size.isNotEmpty) {
      Uri uri = Uri.parse(url);
      uri = uri.replace(queryParameters: {
          "width": size
      });
      url = uri.toString();
      img.attributes['width'] = "${size}px";
    } 
    img.attributes['src'] = url;
    

    parser.addNode(img);

    return true;
  }
}


