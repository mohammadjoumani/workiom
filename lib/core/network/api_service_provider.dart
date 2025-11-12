import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/services/network_info.dart';

import 'api_service.dart';

final apiServiceProvider = Provider.autoDispose<ApiService>(
  (ref) {
    // final settingLocalData = ref.read(
    //   settingLocalDataProvider,
    // );

    final networkInfo = ref.read(
      networkInfoProvider,
    );
    return ApiService(
      networkInfo: networkInfo,
    );
  },
);
