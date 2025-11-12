import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) {
    return NetworkInfoImpl();
  },
);

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker = InternetConnectionChecker();

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
