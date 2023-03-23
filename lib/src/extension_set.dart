import 'block_syntaxes/block_syntax.dart';
import 'block_syntaxes/fenced_code_block_syntax.dart';
import 'block_syntaxes/header_with_id_syntax.dart';
import 'block_syntaxes/ordered_list_with_checkbox_syntax.dart';
import 'block_syntaxes/setext_header_with_id_syntax.dart';
import 'block_syntaxes/table_syntax.dart';
import 'block_syntaxes/unordered_list_with_checkbox_syntax.dart';
import 'inline_syntaxes/autolink_extension_syntax.dart';
import 'inline_syntaxes/color_swatch_syntax.dart';
import 'inline_syntaxes/emoji_syntax.dart';
import 'inline_syntaxes/inline_html_syntax.dart';
import 'inline_syntaxes/inline_syntax.dart';
import 'inline_syntaxes/strikethrough_syntax.dart';

// alset
import 'block_syntaxes/blockquote_syntax.dart';
import 'block_syntaxes/code_block_syntax.dart';
import 'block_syntaxes/empty_block_syntax.dart';
import 'block_syntaxes/header_syntax.dart';
import 'block_syntaxes/horizontal_rule_syntax.dart';
import 'block_syntaxes/html_block_syntax.dart';
import 'block_syntaxes/link_reference_definition_syntax.dart';
import 'block_syntaxes/ordered_list_syntax.dart';
import 'block_syntaxes/paragraph_syntax.dart';
import 'block_syntaxes/setext_header_syntax.dart';
import 'block_syntaxes/unordered_list_syntax.dart';
import 'inline_syntaxes/autolink_syntax.dart';
import 'inline_syntaxes/code_syntax.dart';
import 'inline_syntaxes/decode_html_syntax.dart';
import 'inline_syntaxes/delimiter_syntax.dart';
import 'inline_syntaxes/email_autolink_syntax.dart';
import 'inline_syntaxes/emphasis_syntax.dart';
import 'inline_syntaxes/escape_html_syntax.dart';
import 'inline_syntaxes/escape_syntax.dart';
import 'inline_syntaxes/image_syntax.dart';
import 'inline_syntaxes/inline_syntax.dart';
import 'inline_syntaxes/line_break_syntax.dart';
import 'inline_syntaxes/link_syntax.dart';
import 'inline_syntaxes/soft_line_break_syntax.dart';
import 'inline_syntaxes/text_syntax.dart';
import 'custom_syntax/inline_center_syntax.dart';
import 'custom_syntax/inline_spoiler_syntax.dart';
import 'custom_syntax/image_with_size.dart';

/// ExtensionSets provide a simple grouping mechanism for common Markdown
/// flavors.
///
/// For example, the [gitHubFlavored] set of syntax extensions allows users to
/// output HTML from their Markdown in a similar fashion to GitHub's parsing.
class ExtensionSet {
  /// The [ExtensionSet.none] extension set renders Markdown similar to
  /// [Markdown.pl].
  ///
  /// However, this set does not render _exactly_ the same as Markdown.pl;
  /// rather it is more-or-less the CommonMark standard of Markdown, without
  /// fenced code blocks, or inline HTML.
  ///
  /// [Markdown.pl]: http://daringfireball.net/projects/markdown/syntax
  static final ExtensionSet none = ExtensionSet(const [], const []);

  /// The [commonMark] extension set is close to compliance with [CommonMark].
  ///
  /// [CommonMark]: http://commonmark.org/
  static final ExtensionSet commonMark = ExtensionSet(
    List<BlockSyntax>.unmodifiable(
      <BlockSyntax>[const FencedCodeBlockSyntax()],
    ),
    List<InlineSyntax>.unmodifiable(
      <InlineSyntax>[InlineHtmlSyntax()],
    ),
  );

  /// The [gitHubWeb] extension set renders Markdown similarly to GitHub.
  ///
  /// This is different from the [gitHubFlavored] extension set in that GitHub
  /// actually renders HTML different from straight [GitHub flavored Markdown].
  ///
  /// (The only difference currently is that [gitHubWeb] renders headers with
  /// linkable IDs.)
  ///
  /// [GitHub flavored Markdown]: https://github.github.com/gfm/
  static final ExtensionSet gitHubWeb = ExtensionSet(
    List<BlockSyntax>.unmodifiable(
      <BlockSyntax>[
        const FencedCodeBlockSyntax(),
        const HeaderWithIdSyntax(),
        const SetextHeaderWithIdSyntax(),
        const TableSyntax(),
        const UnorderedListWithCheckboxSyntax(),
        const OrderedListWithCheckboxSyntax(),
      ],
    ),
    List<InlineSyntax>.unmodifiable(
      <InlineSyntax>[
        InlineHtmlSyntax(),
        StrikethroughSyntax(),
        EmojiSyntax(),
        ColorSwatchSyntax(),
        AutolinkExtensionSyntax()
      ],
    ),
  );

  /// The [gitHubFlavored] extension set is close to compliance with the
  /// [GitHub flavored Markdown spec](https://github.github.com/gfm/).
  static final ExtensionSet gitHubFlavored = ExtensionSet(
    List<BlockSyntax>.unmodifiable(
      <BlockSyntax>[
        const FencedCodeBlockSyntax(),
        const TableSyntax(),
        const UnorderedListWithCheckboxSyntax(),
        const OrderedListWithCheckboxSyntax(),
      ],
    ),
    List<InlineSyntax>.unmodifiable(
      <InlineSyntax>[
        InlineHtmlSyntax(),
        StrikethroughSyntax(),
        AutolinkExtensionSyntax()
      ],
    ),
  );

  static final ExtensionSet ALFlavored = ExtensionSet(
    List<BlockSyntax>.unmodifiable(
      <BlockSyntax>[
        const EmptyBlockSyntax(),
        const HtmlBlockSyntax(),
        const SetextHeaderSyntax(),
        const HeaderSyntax(),
        const CodeBlockSyntax(),
        const BlockquoteSyntax(),
        const HorizontalRuleSyntax(),
        const UnorderedListSyntax(),
        const OrderedListSyntax(),
        const LinkReferenceDefinitionSyntax(),
        const ParagraphSyntax()
      ],
    ),
    List<InlineSyntax>.unmodifiable(
      <InlineSyntax>[
        InlineSpoilerSyntax(),
    EmailAutolinkSyntax(),
    AutolinkSyntax(),
    LineBreakSyntax(),
    EmphasisSyntax.asterisk(),
    EmphasisSyntax.underscore(),
    CodeSyntax(),
    SoftLineBreakSyntax(),
    ImageWithSizeSyntax(),
    InlineCenterSyntax(),
      ],
    ),
  );


  final List<BlockSyntax> blockSyntaxes;
  final List<InlineSyntax> inlineSyntaxes;

  ExtensionSet(this.blockSyntaxes, this.inlineSyntaxes);
}
