import 'edition_model.dart';
import 'feature_model.dart';

class EditionsForSelectModel {
  List<FeatureModel>? allFeatures;

  List<EditionsWithFeaturesModel>? editionsWithFeatures;

  EditionsForSelectModel({
    this.allFeatures,
    this.editionsWithFeatures,
  });

  EditionsForSelectModel.fromJson(Map<String, dynamic> json) {
    allFeatures = json['allFeatures'] != null ? FeatureModel.fromJsonList(json['allFeatures']) : [];
    editionsWithFeatures = json['editionsWithFeatures'] != null ? EditionsWithFeaturesModel.fromJsonList(json['editionsWithFeatures']) : [];
  }
}
