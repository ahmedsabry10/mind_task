class ApiConstants {
  //api constants
  static const String apiBaseUrl =
      "https://ihoneyherb.com/test-application/";
  static const String login = "login.php";
  static const String home = "home/home.php";
  //header constants
  static const String langTitle = "Accept-Language";
  static const String langBody = "ar";
  //body constants
  static const String token = 'token';
  static const String tokenBody = 'asd342dsdddsd323dsdadasd3e';
  static const String platform = 'platform';
  static const String androidPlatform = '1';
  static const String iosPlatform = '2';
  static const String deviceIdTitle = 'device_id';
  static const String deviceIdBody= 'bfghtr5yrtytd654e6trd';


}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
