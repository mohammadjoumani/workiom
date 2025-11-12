class NetworkResponseModel<T> {
  final int? code;
  final String? status;
  final String? message;
  final int? totalPages;
  final T? data;

  NetworkResponseModel({
    this.code,
    this.status,
    this.message,
    this.totalPages,
    this.data,
  });

  factory NetworkResponseModel.fromJson({
    required Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
    T Function(List<dynamic> jsonList)? fromJsonTList,
  }) {
    return NetworkResponseModel(
      code: json['code'],
      status: json['status'],
      message: json['message'] ?? '',
      totalPages: json['total_pages'],
      data: _getData(json, fromJsonT, fromJsonTList),
    );
  }

  static dynamic _getData<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
    T Function(List<dynamic> jsonList)? formJsonList,
  ) {
    final data = json['result'];
    if (data != null) {
      if (fromJsonT != null && data is Map) {
        return fromJsonT(
          json['result'],
        );
      }
      if (formJsonList != null && data is List) {
        return formJsonList(
          json['result'],
        );
      }
    }

    return null;
  }
}