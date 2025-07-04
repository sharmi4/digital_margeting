// import 'dart:convert';
// import 'package:dio/dio.dart';
// import '../model/statergy_model.dart';

// class StrategyApiService {
//   final Dio _dio = Dio();
//   final String apiKey = "AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc"; // Use your actual API Key

//   Future<String?> sendToGemini(StrategyInputModel model) async {
//     try {
//       final prompt = '''
// Generate a digital marketing strategy for the following:
// - Business Name: ${model.businessName}
// - Website: ${model.websiteUrl}
// - About: ${model.aboutBrand}
// - Category: ${model.businessCategory}
// - Audience Type: ${model.audienceType}
// - Target Location: ${model.targetLocation}
// - LinkedIn: ${model.linkedinUrl}
// - Facebook: ${model.facebookUrl}
// - GMB: ${model.gmbUrl}
// - Instagram: ${model.instagramUrl}
// ''';

//       final response = await _dio.post(
//         "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey",
//         options: Options(
//           headers: {"Content-Type": "application/json"},
//         ),
//         data: jsonEncode({
//           "contents": [
//             {
//               "parts": [
//                 {"text": prompt}
//               ]
//             }
//           ]
//         }),
//       );

//       final text = response.data["candidates"][0]["content"]["parts"][0]["text"].toString().replaceAll("*", "");
//       return text;
//     } catch (e) {
//       print("Gemini API error: $e");
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:dio/dio.dart';
import '../model/seo_task_model.dart';

class StrategyApiService {
  final Dio _dio = Dio();
  final String apiKey =
      "AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc"; // Replace with your actual key

  Future<String?> sendToGemini() async {
    try {
      final prompt = '''
"You are an SEO expert. I need a structured and exact 90 task for 90-day SEO strategy to generate leads for a web design business targeting both B2B and B2C in local and international markets

Format the response as a JSON array of 90 DAILY tasks (one per day). Each item must include:

- "day": number (1 to 90)
- "title": short task title
- "instructions": list of 3-5 step-by-step strings (not a paragraph)
- "youtube": optional link (only if relevant)

Example:
[
  {
    "day": 1,
    "title": "SEO Audit",
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

  Future<List<SeoTask>> getSeoTasks() async {
    try {
      final text = await sendToGemini();
      if (text == null || text.isEmpty) return [];

      final List<dynamic> parsed = jsonDecode(text);
      return parsed.map((e) => SeoTask.fromJson(e)).toList();
    } catch (e) {
      print("Parsing error: $e");
      return [];
    }
  }
}
