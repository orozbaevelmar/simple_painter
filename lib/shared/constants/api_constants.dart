class ApiConstants {
  static const String https = 'https://';
  static const String apiUrl = 'back.abc.ab';
  static const String baseUrl = '$https$apiUrl';
  static const String baseUrlWithPath = '$https$apiUrl/api/v1';

  // ================= AUTH =================
  static const String login = '/auth/login/';
  static const String logout = '/auth/logout/';
  static const String register = '/auth/register/';
  static const String profile = '/auth/profile/';
}
