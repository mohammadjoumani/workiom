class PasswordComplexityModel {
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

  PasswordComplexityModel({
    this.requireDigit,
    this.requireLowercase,
    this.requireNonAlphanumeric,
    this.requireUppercase,
    this.requiredLength,
  });

  PasswordComplexityModel.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['requireDigit'] = requireDigit;
    data['requireLowercase'] = requireLowercase;
    data['requireNonAlphanumeric'] = requireNonAlphanumeric;
    data['requireUppercase'] = requireUppercase;
    data['requiredLength'] = requiredLength;
    return data;
  }
}
