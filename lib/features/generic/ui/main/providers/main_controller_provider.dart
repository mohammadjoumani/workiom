import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/generic/ui/main/controller/main_controller.dart';
import 'package:workiom/features/generic/ui/main/controller/main_state.dart';

final mainControllerProvider = NotifierProvider.autoDispose<MainController, MainState>(
  () {
    return MainController();
  },
);
