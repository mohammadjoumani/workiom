class UserModel {
  int? tenantId;
  String? tenancyName;
  String? name;
  String? userName;
  String? emailAddress;
  bool? isTenantActive;
  bool? isActive;
  bool? isEmailConfirmationRequired;
  String? captchaResult;

  UserModel({
    this.tenantId,
    this.tenancyName,
    this.name,
    this.userName,
    this.emailAddress,
    this.isTenantActive,
    this.isActive,
    this.isEmailConfirmationRequired,
    this.captchaResult,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    tenancyName = json['tenancyName'];
    name = json['name'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    isTenantActive = json['isTenantActive'];
    isActive = json['isActive'];
    isEmailConfirmationRequired = json['isEmailConfirmationRequired'];
    captchaResult = json['captchaResult'];
  }
}
