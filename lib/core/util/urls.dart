import 'package:url_launcher/url_launcher.dart';

class Urls {
  Urls._();

  static void _show(String url) {
    launchUrl(Uri.parse(url));
  }
}
