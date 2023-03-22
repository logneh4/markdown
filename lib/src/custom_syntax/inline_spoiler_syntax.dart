import '../inline_syntaxes/inline_syntax.dart';
import '../inline_syntaxes/delimiter_syntax.dart';
import '../inline_parser.dart';
import '../charcode.dart';
import '../block_syntaxes/block_syntax.dart';
import '../block_parser.dart';
import '../ast.dart';
import '../line.dart';
import '../util.dart';
import '../patterns.dart';
import '../line.dart';
import '../ast.dart';
import '../block_syntaxes/list_syntax.dart';



class InlineSpoilerSyntax extends InlineSyntax {
  InlineSpoilerSyntax() : super(r'~!(.*)!~');

  @override
  bool onMatch(InlineParser parser, Match match) {
    final url = match[1]!;
    final text = parser.encodeHtml ? escapeHtml(url) : url;
    final anchor = Element.text('spoiler', text);

    parser.addNode(anchor);

    return true;
  }
}