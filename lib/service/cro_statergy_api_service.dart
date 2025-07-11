import 'dart:convert';
import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:dio/dio.dart';

class CROStrategyApiService {
  final Dio _dio = Dio();
  final String apiKey =
      "AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc"; // Replace with your actual key

  Future<String?> sendToGemini() async {
    try {
      final prompt = '''
"You are an Conversion Rate Optimization expert. I need a structured and exact ${Helper.duration} task for ${Helper.duration}-day Conversion Rate Optimization strategy to generate leads for a web design business targeting both B2B and B2C in local and international markets

Format the response as a JSON array of ${Helper.duration} DAILY tasks (one per day). Each item must include:

- "day": number (from 1 to ${Helper.duration})
- "title": short task title
- "instructions": list of 3-5 step-by-step strings (not a paragraph)
- "youtube": optional link (only if relevant)

Example:
[
  {
    "day": 1,
    "title": "Conversion Rate Optimization Audit",
    "instructions": [
      "Use Screaming Frog to crawl your website.",
      "Check for broken links and redirect chains.",
      "Export the audit report to analyze."
    ],
    "youtube": "https://youtube.com/example-audit-video"
  }
]

Business Details:
- Business Name: ${Helper.businessname}
- Category: ${Helper.businesscategoryselected}
- Audience Type: ${Helper.autiencetype}
- Target Location: ${Helper.targetlocation}
- Goal: ${Helper.selectgoal}
''';

      final response = await _dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt},
              ],
            },
          ],
        }),
      );

      final content =
          response.data["candidates"][0]["content"]["parts"][0]["text"]
              .toString()
              .replaceAll("```json", "")
              .replaceAll("```", "")
              .trim();

      return content;
    } catch (e) {
      print("Gemini API error: $e");
      return null;
    }
  }

  
}
