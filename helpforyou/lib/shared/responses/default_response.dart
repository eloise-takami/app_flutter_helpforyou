enum ResponseStatus { SUCCESS, FAILED }

class DefaultResponse<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  const DefaultResponse({this.object, this.message, this.status});
}

class ResponseBuilder {
  static DefaultResponse failed<T>({T object, String message}) {
    return DefaultResponse<T>(
      object: object,
      message: message,
      status: ResponseStatus.FAILED,
    );
  }

  static DefaultResponse success<T>({T object, String message}) {
    return DefaultResponse<T>(
      object: object,
      message: message,
      status: ResponseStatus.SUCCESS,
    );
  }
}
