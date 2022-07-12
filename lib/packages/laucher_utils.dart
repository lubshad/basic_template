import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
  )) {
    throw 'Could not launch $url';
  }
}
