class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() => "$_prefix , $_message";
}



class FetchDataException extends AppException {
  //FetchDataException(super.message, super.prefix);

  FetchDataException([String? message])
      : super(message,
      "Error during communication"); //here second parameter is prefix of super class
}



class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "BadRequestException");
}



class UnAuthorizeException extends AppException {
  UnAuthorizeException([String? message])
      : super(message, "UnAuthorizeException");
}




class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message,"Invalid input");
}




class UnKnownException extends AppException{
  UnKnownException([String? message]):super(message,"Unknown exception occur");
}
















