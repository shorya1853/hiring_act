import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchData {
  static Future<List<dynamic>> getData() async {
    const url = 'https://api.pexels.com/v1/search?query=people';

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'sCithLyAtvOxFIUWJ3124vVkMeLTb94JoTzrrXKwZPwdDNM0ycuE5J1Y',
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> photos = jsonData['photos'];
      return photos;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
