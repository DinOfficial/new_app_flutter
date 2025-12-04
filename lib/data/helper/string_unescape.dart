import 'package:html_unescape/html_unescape.dart';

var _unescape = HtmlUnescape();

String unescape(String text) {
  return _unescape.convert(text);
}

