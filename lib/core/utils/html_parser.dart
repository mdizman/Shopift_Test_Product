import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/widgets.dart';

class HtmlParser {
  static Widget render(String html) {
    return Html(data: html);
  }
}
