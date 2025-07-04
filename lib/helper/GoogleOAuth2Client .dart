import 'package:oauth2_client/oauth2_client.dart';

class GoogleOAuth2Client extends OAuth2Client {
  GoogleOAuth2Client({required String redirectUri, required String customUriScheme})
      : super(
          authorizeUrl: 'https://accounts.google.com/o/oauth2/auth',
          tokenUrl: 'https://oauth2.googleapis.com/token',
          redirectUri: redirectUri,
          customUriScheme: customUriScheme,
        );
}
