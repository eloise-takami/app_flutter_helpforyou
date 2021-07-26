enum ResponseStatus { SUCCESS, FAILED }

class DefaultResponse<T> {
  final T? object;
  final String? message;
  final ResponseStatus? status;

  const DefaultResponse({this.object, this.message, this.status});
}

class ResponseBuilder {
  static DefaultResponse<T> failed<T>({required String message}) {
    return DefaultResponse<T>(
      message: message,
      status: ResponseStatus.FAILED,
    );
  }

  static DefaultResponse<T> success<T>({required T object}) {
    return DefaultResponse<T>(
      object: object,
      status: ResponseStatus.SUCCESS,
    );
  }
}
