import 'package:url_launcher/url_launcher.dart';

abstract interface class Urls {
  static void show(String url) {
    launchUrl(Uri.parse(url));
  }
}
