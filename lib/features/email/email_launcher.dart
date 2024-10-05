import 'package:url_launcher/url_launcher.dart';

class EmailLauncher {
  static Future<void> sendEmail(Uri emailUri) async {
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Não foi possível abrir o email.';
    }
  }
}