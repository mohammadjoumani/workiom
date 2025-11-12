import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/network/api_service_provider.dart';
import 'package:workiom/features/auth/repository/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
  (ref) {
    final apiService = ref.read(
      apiServiceProvider,
    );

    return AuthRepository(
      apiService: apiService,
    );
  },
);
