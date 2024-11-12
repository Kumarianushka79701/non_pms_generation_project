// lib/config.dart
class AppConfig {
  static const String devBaseUrl = 'http://localhost:3000';
  static const String stagingBaseUrl = 'http://staging.server.com';
  static const String prodBaseUrl = 'https://production.server.com';

  // Switch this base URL as needed for different environments
  static const String currentBaseUrl = devBaseUrl;
}
