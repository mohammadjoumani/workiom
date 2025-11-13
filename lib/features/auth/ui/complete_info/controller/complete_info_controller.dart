import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workiom/core/extension/validation_extension.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/core/util/debouncer.dart';
import 'package:workiom/features/auth/providers/auth_repository_provider.dart';

import 'complete_info_state.dart';

class CompleteInfoController extends Notifier<CompleteInfoState> {
  final Debouncer _debouncer = Debouncer();

  @override
  CompleteInfoState build() {
    state = _onInit();
    return state;
  }

  CompleteInfoState _onInit() => CompleteInfoState();

  void getEditionsForSelect() async {
    final repository = ref.read(authRepositoryProvider);
    state = state.copyWith(
      getEditionsForSelectDataState: DataState.loading,
    );
    final result = await repository.getEditionsForSelect();
    result.fold(
      (l) => state = state.copyWith(
        getEditionsForSelectDataState: DataState.failure,
        // failure: l,
      ),
      (r) => state = state.copyWith(
        getEditionsForSelectDataState: DataState.success,
        editionsForSelect: r,
        editionId: r?.editionsWithFeatures?.first.edition?.id ?? 0,
      ),
    );
  }

  void changeWorkspaceName(String name) async {
    final repository = ref.read(authRepositoryProvider);
    if (name.validateTenantName.isNotEmpty) {
      state = state.copyWith(
        workspaceName: name,
        workspaceNameValidationMessage: name.validateTenantName,
      );
      return;
    }
    _debouncer.run(
      () async {
        state = state.copyWith(
          checkTenantAvailableDataState: DataState.loading,
          workspaceName: name,
          workspaceNameValidationMessage: name.validateRequiredField,
        );
        final result = await repository.isTenantAvailable(
          name: name,
        );
        result.fold(
          (l) => state = state.copyWith(
            checkTenantAvailableDataState: DataState.failure,
            workspaceName: name,
            workspaceNameValidationMessage: l.message,
          ),
          (r) => state = state.copyWith(
            checkTenantAvailableDataState: DataState.success,
            workspaceName: name,
            workspaceNameValidationMessage: r ? '' : 'This workspace name is already taken.',
          ),
        );
      },
    );
  }

  void changeFirstName(String name) {
    state = state.copyWith(
      firstName: name,
      firstNameValidationMessage: name.validateFirstName,
    );
  }

  void changeLastName(String name) {
    state = state.copyWith(
      lastName: name,
      lastNameValidationMessage: name.validateLastName,
    );
  }

  void register({
    required String email,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    state = state.copyWith(
      submitRegisterDataState: DataState.loading,
    );
    final result = await repository.register(
      email: email,
      firstName: state.firstName,
      lastName: state.lastName,
      password: password,
      name: state.workspaceName,
      editionId: state.editionId,
    );
    result.fold(
      (l) => state = state.copyWith(
        submitRegisterDataState: DataState.failure,
        failure: l,
      ),
      (r) => state = state.copyWith(
        submitRegisterDataState: DataState.success,
      ),
    );
  }
}
