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

class InlineCenterSyntax extends DelimiterSyntax {
  InlineCenterSyntax()
      : super(
          r'~+',
          requiresDelimiterRun: true,
          allowIntraWord: true,
          tags: _tags,
          startCharacter: $tilde,
        );
        static final _tags = [DelimiterTag('center', 3)];
}