abstract class ApiErrors {
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

abstract class Endpoints {
  static const String register = "/register";
  static const String login = "/login";
  static const String user = "/user";
  static const String events = '/events';
  static const String participateinEvent = '/participate';
  static const String eventLocation = 'events/location';
  static const String shareEvent = '/share';
  static const String eventUsers = '/events/users';
  static const String eventValidation = '/validate';
  static const String posts = '/posts';
}
