import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/auth/ui/complete_info/controller/complete_info_controller.dart';
import 'package:workiom/features/auth/ui/complete_info/controller/complete_info_state.dart';

final completeInfoControllerProvider = NotifierProvider.autoDispose<CompleteInfoController, CompleteInfoState>(
  () {
    return CompleteInfoController();
  },
);
