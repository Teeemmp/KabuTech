import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kabutech/models/analysis.dart';
import 'package:kabutech/services/settings_service.dart';

class AnalyzingService {
  final _settingsService = SettingsService();

  Future<Analysis> process(String imagePath, http.Client client) async {
    final url = await _settingsService.get();

    final header = {
      'accept': 'application/json',
      'content-type': 'multipart/form-data',
    };

    final uri = Uri.parse('${url.server}/api/analyze');
    final request = http.MultipartRequest("POST", uri);
    request.headers.addAll(header);

    final image = await http.MultipartFile.fromPath('image', imagePath);
    request.files.add(image);

    final streamResponse = await client.send(request);

    if (streamResponse.statusCode == 200) {
      final response = await http.Response.fromStream(streamResponse);

      final json = jsonDecode(response.body);

      return Analysis.fromJson(json);
    } else {
      return Analysis.empty();
    }
  }
}
