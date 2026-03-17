class Result<T, E> {
  final T? data;
  final E? error;

  const Result._({this.data, this.error});

  factory Result.success(T data) => Result._(data: data);

  factory Result.failure(E error) => Result._(error: error);

  bool get isSuccess => data != null && error == null;
  bool get isFailure => error != null;

  void when({
    required void Function(T data) onSuccess,
    required void Function(E error) onFailure,
  }) {
    if (isSuccess) {
      onSuccess(data as T);
    } else if (isFailure) {
      onFailure(error as E);
    }
  }

  /// fold() forces handling both success and failure cases.
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(E error) onFailure,
  }) {
    if (error != null) {
      return onFailure(error as E);
    }
    return onSuccess(data as T);
  }
}
