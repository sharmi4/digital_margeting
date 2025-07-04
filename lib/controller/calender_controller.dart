import 'package:digital_marketing_stratergy/model/generated_content_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GeminiController extends GetxController {
  final Dio _dio = Dio();
  final String _apiKey = 'AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc';

  var isLoading = false.obs;
  var generatedContent = Rxn<GeneratedContent>();
  var error = ''.obs;

  // Selected titles list
  var selectedTitles = <String>[].obs;

  // Map to hold description + hashtags for each selected title
  var contentByTitle = <String, GeneratedContent>{}.obs;

  void toggleTitleSelection(String title) {
    if (selectedTitles.contains(title)) {
      selectedTitles.remove(title);
      contentByTitle.remove(title);  // Remove content when deselected
    } else {
      selectedTitles.add(title);
      generateContentForTitle(title);
    }
  }

  Future<void> generateWomensDayContent() async {
    isLoading.value = true;
    error.value = '';
    generatedContent.value = null;
    selectedTitles.clear();
    contentByTitle.clear();

    const url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc';

    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text":
                      "Create me a Title and Description for a Women's Day poster and some hashtags."
                }
              ]
            }
          ]
        },
      );

      final generatedText =
          response.data['candidates']?[0]['content']?['parts']?[0]['text'];

      if (generatedText != null) {
        generatedContent.value = GeneratedContent.fromRawText(generatedText);
      } else {
        error.value = 'No content generated.';
      }
    } catch (e) {
      error.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> generateContentForTitle(String title) async {
    isLoading.value = true;
    error.value = '';

    const url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyD24Bryve9_oNN1kmq0oem4vZwPIqlI2dc';

    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text":
                      "Create me a Title and Description for a $title poster and some hashtags."
                }
              ]
            }
          ]
        },
      );

      final generatedText =
          response.data['candidates']?[0]['content']?['parts']?[0]['text'];

      if (generatedText != null) {
        contentByTitle[title] = GeneratedContent.fromRawText(generatedText);
      } else {
        error.value = 'No content generated for $title.';
      }
    } catch (e) {
      error.value = 'Error generating content for $title: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
