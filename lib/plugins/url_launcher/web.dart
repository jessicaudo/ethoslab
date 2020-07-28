  import 'package:universal_html/prefer_universal/html.dart' as html;
  //import 'package:universal_html/html.dart';

//eases cross-platform development and supports html and xml documents
class UrlUtils {
  UrlUtils._();

  static void open(String url, {String name}) {
    html.window.open(url, name);
  }
}