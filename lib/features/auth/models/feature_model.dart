class FeatureModel {
  String? name;
  String? parentName;
  String? displayName;
  String? description;
  String? defaultValue;

  FeatureModel({
    this.name,
    this.parentName,
    this.displayName,
    this.description,
    this.defaultValue,
  });

  FeatureModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    parentName = json['parentName'];
    displayName = json['displayName'];
    description = json['description'];
    defaultValue = json['defaultValue'];
  }

  static List<FeatureModel> fromJsonList(List<dynamic> jsonList) {
    return (jsonList).map((item) => FeatureModel.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['parentName'] = parentName;
    data['displayName'] = displayName;
    data['description'] = description;
    data['defaultValue'] = defaultValue;
    return data;
  }
}
