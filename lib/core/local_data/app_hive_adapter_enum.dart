// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:nawras_pharma_mobile/core/extension/string_extension.dart';
// import 'package:nawras_pharma_mobile/features/auth/models/user_model.dart';
// import 'package:nawras_pharma_mobile/features/doctor/models/doctor_model.dart';
// import 'package:nawras_pharma_mobile/features/generic/models/app_config_model.dart';
// import 'package:nawras_pharma_mobile/features/generic/models/base_config_model.dart';
// import 'package:nawras_pharma_mobile/features/generic/models/product_model.dart';
// import 'package:nawras_pharma_mobile/features/generic/models/region_model.dart';
// import 'package:nawras_pharma_mobile/features/generic/models/version_info_model.dart';
// import 'package:nawras_pharma_mobile/features/gift/models/gift_model.dart';
// import 'package:nawras_pharma_mobile/features/meeting/models/meeting_model.dart';
// import 'package:nawras_pharma_mobile/features/visit/models/double_visit_model.dart';
// import 'package:nawras_pharma_mobile/features/visit/models/health_visit_line_model.dart';
// import 'package:nawras_pharma_mobile/features/visit/models/visit_model.dart';
//
// // enum AppHiveAdapterEnum {
// //   userAdapter('user'),
// //   visitAdapter('visit'),
// //   healthVisitLine('health_visit_line'),
// //   // doubleVisitAdapter('double_visit'),
// //   baseConfigAdapter('base_config'),
// //   productAdapter('product'),
// //   regionAdapter('region'),
// //   doctorAdapter('doctor'),
// //   // giftAdapter('gift'),
// //   // meetingAdapter('meeting'),
// //   settingAdapter('setting');
// //
// //   final String boxName;
// //
// //   const AppHiveAdapterEnum(this.boxName);
// // }
//
// class AppHiveAdapter {
//   static String get getSettingAdapter => "setting";
//
//   static String get getUserAdapter => "user";
//
//   static String get getVisitAdapter => "visit";
//
//   static String get getHealthVisitLineAdapter => "health_visit_line";
//
//   static String get getBaseConfigAdapter => "base_config";
//
//   static String get getAppConfigAdapter => "app_config";
//
//   static String get getProductAdapter => "product";
//
//   static String get getRegionAdapter => "region";
//
//   static String get getDoctorAdapter => "doctor";
// }
//
// Future<void> initHive() async {
//   try {
//     await Hive.initFlutter();
//     Hive.registerAdapter(UserModelAdapter());
//     Hive.registerAdapter(VisitModelAdapter());
//     Hive.registerAdapter(HealthVisitLineModelAdapter());
//     Hive.registerAdapter(DoubleVisitModelAdapter());
//     Hive.registerAdapter(BaseConfigModelAdapter());
//     Hive.registerAdapter(AppConfigModelAdapter());
//     Hive.registerAdapter(VersionInfoModelAdapter());
//     Hive.registerAdapter(ProductModelAdapter());
//     Hive.registerAdapter(RegionModelAdapter());
//     Hive.registerAdapter(DoctorModelAdapter());
//     Hive.registerAdapter(GiftModelAdapter());
//     Hive.registerAdapter(MeetingModelAdapter());
//
//     await Future.wait(
//       [
//         Hive.openBox<dynamic>(AppHiveAdapter.getSettingAdapter),
//         Hive.openBox<UserModel>(AppHiveAdapter.getUserAdapter),
//         Hive.openBox<BaseConfigModel>(AppHiveAdapter.getBaseConfigAdapter),
//         Hive.openBox<AppConfigModel>(AppHiveAdapter.getAppConfigAdapter),
//         Hive.openBox<ProductModel>(AppHiveAdapter.getProductAdapter),
//         Hive.openBox<RegionModel>(AppHiveAdapter.getRegionAdapter),
//         Hive.openBox<DoctorModel>(AppHiveAdapter.getDoctorAdapter),
//         Hive.openBox<VisitModel>(AppHiveAdapter.getVisitAdapter),
//         Hive.openBox<HealthVisitLineModel>(AppHiveAdapter.getHealthVisitLineAdapter),
//       ],
//     );
//   } catch (e) {
//     'Hive Exception: $e'.log();
//   }
// }
