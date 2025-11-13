import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/auth/ui/complete_info/providers/complete_info_controller_provider.dart';

TextEditingController useRegisterFirstNameController({
  required WidgetRef ref,
  String initialText = '',
}) {
  return use(
    _RegisterFirstNameControllerHook(
      ref: ref,
      initialText: initialText,
    ),
  );
}

class _RegisterFirstNameControllerHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String initialText;

  const _RegisterFirstNameControllerHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, Hook<TextEditingController>> createState() => _RegisterFirstNameControllerHookState();
}

class _RegisterFirstNameControllerHookState extends HookState<TextEditingController, _RegisterFirstNameControllerHook> {
  late final TextEditingController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = TextEditingController(
      text: hook.initialText,
    );
    _controller.addListener(
      listener,
    );
  }

  @override
  TextEditingController build(BuildContext context) {
    return _controller;
  }

  @override
  void didUpdateHook(_RegisterFirstNameControllerHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  void dispose() {
    _controller.removeListener(
      listener,
    );
    _controller.dispose();

    super.dispose();
  }

  void listener() {
    hook.ref.read(completeInfoControllerProvider.notifier).changeFirstName(
          _controller.text,
        );
  }
}
