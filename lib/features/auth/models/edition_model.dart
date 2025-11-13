class EditionsWithFeaturesModel {
  EditionModel? edition;

  // List<FeatureValues>? featureValues;

  EditionsWithFeaturesModel({
    this.edition,
    // this.featureValues,
  });

  EditionsWithFeaturesModel.fromJson(Map<String, dynamic> json) {
    edition = json['edition'] != null ? EditionModel.fromJson(json['edition']) : null;
    // if (json['featureValues'] != null) {
    //   featureValues = <FeatureValues>[];
    //   json['featureValues'].forEach((v) {
    //     featureValues!.add(new FeatureValues.fromJson(v));
    //   });
    // }
  }

  static List<EditionsWithFeaturesModel> fromJsonList(List<dynamic> jsonList) {
    return (jsonList).map((item) => EditionsWithFeaturesModel.fromJson(item)).toList();
  }
}

class EditionModel {
  String? name;
  String? displayName;
  String? publicDescription;
  bool? isPublished;
  bool? isRegistrable;
  num? type;
  num? minimumUsersCount;
  num? monthlyPrice;
  num? annualPrice;
  num? waitingDayAfterExpire;
  num? trialDayCount;
  num? countAllowExtendTrial;
  bool? hasTrial;
  bool? disableWorkspaceAfterExpire;
  bool? isMostPopular;
  num? id;

  EditionModel({
    this.name,
    this.displayName,
    this.publicDescription,
    this.isPublished,
    this.isRegistrable,
    this.type,
    this.minimumUsersCount,
    this.monthlyPrice,
    this.annualPrice,
    this.waitingDayAfterExpire,
    this.trialDayCount,
    this.countAllowExtendTrial,
    this.hasTrial,
    this.disableWorkspaceAfterExpire,
    this.isMostPopular,
    this.id,
  });

  EditionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    publicDescription = json['publicDescription'];
    isPublished = json['isPublished'];
    isRegistrable = json['isRegistrable'];
    type = json['type'];
    minimumUsersCount = json['minimumUsersCount'];
    monthlyPrice = json['monthlyPrice'];
    annualPrice = json['annualPrice'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'];
    trialDayCount = json['trialDayCount'];
    countAllowExtendTrial = json['countAllowExtendTrial'];
    hasTrial = json['hasTrial'];
    disableWorkspaceAfterExpire = json['disableWorkspaceAfterExpire'];
    isMostPopular = json['isMostPopular'];
    id = json['id'];
  }
}
