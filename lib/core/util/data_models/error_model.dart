class ErrorModel {
  int? code;
  String? message;
  String? details;

  ErrorModel({
    this.code,
    this.message,
    this.details,
  });

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
  }
}
