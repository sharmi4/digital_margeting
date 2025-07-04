import 'package:digital_marketing_stratergy/helper/GoogleOAuth2Client%20.dart';
import 'package:oauth2_client/oauth2_helper.dart';

class GoogleBusinessAuth {
  static OAuth2Helper getHelper() {
    final client = GoogleOAuth2Client(
      redirectUri: 'com.example.digital_marketing_stratergy:/oauth2redirect',
      customUriScheme: 'com.example.digital_marketing_stratergy',
    );
    return OAuth2Helper(
      client,
      clientId: '675017801680-osdf10p764vqph7ka1svov7hfg0qnodn.apps.googleusercontent.com',
      scopes: ['https://www.googleapis.com/auth/business.manage'],
    );
  }
}
