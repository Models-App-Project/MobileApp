class EmailLauncherFactory {
  static Uri createEmailUri({
    required String to,
    required String subject,
    required String body,
  }) {
    return Uri(
      scheme: 'mailto',
      path: to,
      query: 'subject=$subject&body=$body',
    );
  }
}