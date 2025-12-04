class Urls {
  static const String _baseUrl = 'https://news.fcsapi.com';
  static String token = 'sCXf3aHDy3rdyiHpQ7GRCH';

  static String urlsByCategory(String category) => '$_baseUrl/api/news?category=$category&access_key=$token';
  static String newsDetailsById(String contentApi) => contentApi;

}