import 'dart:async';
import 'package:http/http.dart' as http;

const url = "https://api.github.com/repos/tusharmutreja/gitCommits/commits";

class Api {
  static Future getCommits() {
    return http.get(
      url,
      headers: {'Accept': 'application/vnd.github.v3+json'}
    );
  }
}