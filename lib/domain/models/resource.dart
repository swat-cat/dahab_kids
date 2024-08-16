enum Status {
  success,
  noConnection,
  httpError,
  unknownError,
}

class Resource<T> {
  final Status status;
  final T? data;
  final String? message;

  Resource._({required this.status, this.data, this.message});

  factory Resource.success(T data) {
    return Resource._(status: Status.success, data: data);
  }

  factory Resource.noConnection(String message) {
    return Resource._(status: Status.noConnection, message: message);
  }

  factory Resource.httpError(String message) {
    return Resource._(status: Status.httpError, message: message);
  }

  factory Resource.unknownError(String message) {
    return Resource._(status: Status.unknownError, message: message);
  }
}