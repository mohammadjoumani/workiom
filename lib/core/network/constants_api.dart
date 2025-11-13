class ConstantsApi {
  static const String baseUrl = "https://api.workiom.club/api/";

  //Api Auth
  static String get getCurrentLoginInfoUrl => "services/app/Session/GetCurrentLoginInformations";

  static String get getEditionsForSelectUrl => "services/app/TenantRegistration/GetEditionsForSelect";

  static String get getPasswordComplexitySettingUrl => "services/app/Profile/GetPasswordComplexitySetting";

  static String get tenantAvailableUrl => "services/app/Account/IsTenantAvailable";

  static String get registerTenantUrl => "services/app/TenantRegistration/RegisterTenant";

  static String get authenticateUrl => "TokenAuth/Authenticate";
}
