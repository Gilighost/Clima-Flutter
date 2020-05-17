import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show HttpStatus;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  dynamic getData() async {
    print('getting from: $url');
    http.Response response = await http.get(url);

    dynamic data;
    if (response.statusCode == HttpStatus.ok) {
      data = jsonDecode(response.body);
    } else {
      print({response.statusCode, response.reasonPhrase});
    }

    return data;
  }
}
