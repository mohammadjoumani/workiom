class CurrentLoginModel {
  dynamic user;
  dynamic tenant;

  CurrentLoginModel({
    this.user,
    this.tenant,
  });

  CurrentLoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    tenant = json['tenant'];
  }
}
