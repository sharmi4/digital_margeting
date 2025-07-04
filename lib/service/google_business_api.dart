import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postToGoogleBusiness(String accessToken, String locationId) async {
  final locationName = 'locations/$locationId';
  final url = 'https://businessprofile.googleapis.com/v1/$locationName/localPosts';

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "summary": "This is a test post from Flutter!",
      "languageCode": "en",
      "topicType": "STANDARD"
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Post created successfully!');
  } else {
    print('Failed to post: ${response.statusCode} - ${response.body}');
  }
}
