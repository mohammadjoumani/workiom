class TenantAvailableModel {
  int? state;
  int? tenantId;
  String? serverRootAddress;

  TenantAvailableModel({
    this.state,
    this.tenantId,
    this.serverRootAddress,
  });

  TenantAvailableModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    tenantId = json['tenantId'];
    serverRootAddress = json['serverRootAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state'] = state;
    data['tenantId'] = tenantId;
    data['serverRootAddress'] = serverRootAddress;
    return data;
  }
}
