import 'password_complexity_model.dart';

class GetPasswordComplexitySettingModel {
  PasswordComplexityModel? setting;

  GetPasswordComplexitySettingModel({
    this.setting,
  });

  GetPasswordComplexitySettingModel.fromJson(Map<String, dynamic> json) {
    setting = json['setting'] != null ? PasswordComplexityModel.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    return data;
  }
}
