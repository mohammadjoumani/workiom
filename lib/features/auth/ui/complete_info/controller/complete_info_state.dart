import 'package:workiom/core/network/failure.dart';
import 'package:workiom/core/util/data_state.dart';
import 'package:workiom/features/auth/models/editions_for_select_model.dart';

class CompleteInfoState {
  final DataState checkTenantAvailableDataState;
  final DataState submitRegisterDataState;
  final DataState getEditionsForSelectDataState;
  final EditionsForSelectModel? editionsForSelect;
  final String workspaceName;
  final String workspaceNameValidationMessage;
  final String firstName;
  final String firstNameValidationMessage;
  final String lastName;
  final String lastNameValidationMessage;
  final int editionId;
  final Failure? failure;

  CompleteInfoState({
    this.submitRegisterDataState = DataState.initial,
    this.checkTenantAvailableDataState = DataState.initial,
    this.getEditionsForSelectDataState = DataState.initial,
    this.editionsForSelect,
    this.workspaceName = '',
    this.workspaceNameValidationMessage = '',
    this.firstName = '',
    this.firstNameValidationMessage = '',
    this.lastName = '',
    this.lastNameValidationMessage = '',
    this.editionId = 0,
    this.failure,
  });

  CompleteInfoState copyWith({
    DataState? checkTenantAvailableDataState,
    DataState? submitRegisterDataState,
    DataState? getEditionsForSelectDataState,
    EditionsForSelectModel? editionsForSelect,
    String? workspaceName,
    String? workspaceNameValidationMessage,
    String? firstName,
    String? firstNameValidationMessage,
    String? lastName,
    String? lastNameValidationMessage,
    int? editionId,
    Failure? failure,
  }) {
    return CompleteInfoState(
      checkTenantAvailableDataState: checkTenantAvailableDataState ?? this.checkTenantAvailableDataState,
      submitRegisterDataState: submitRegisterDataState ?? this.submitRegisterDataState,
      getEditionsForSelectDataState: getEditionsForSelectDataState ?? this.getEditionsForSelectDataState,
      editionsForSelect: editionsForSelect ?? this.editionsForSelect,
      workspaceName: workspaceName ?? this.workspaceName,
      workspaceNameValidationMessage: workspaceNameValidationMessage ?? this.workspaceNameValidationMessage,
      firstName: firstName ?? this.firstName,
      firstNameValidationMessage: firstNameValidationMessage ?? this.firstNameValidationMessage,
      lastName: lastName ?? this.lastName,
      lastNameValidationMessage: lastNameValidationMessage ?? this.lastNameValidationMessage,
      editionId: editionId ?? this.editionId,
      failure: failure ?? this.failure,
    );
  }
}
