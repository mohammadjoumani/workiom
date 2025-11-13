import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workiom/features/auth/ui/confirm_password/providers/confirm_password_controller_provider.dart';

TextEditingController useRegisterEmailController({
  required WidgetRef ref,
  String initialText = '',
}) {
  return use(
    _RegisterEmailControllerHook(
      ref: ref,
      initialText: initialText,
    ),
  );
}

class _RegisterEmailControllerHook extends Hook<TextEditingController> {
  final WidgetRef ref;
  final String initialText;

  const _RegisterEmailControllerHook({
    required this.ref,
    required this.initialText,
  });

  @override
  HookState<TextEditingController, Hook<TextEditingController>> createState() => _RegisterEmailControllerHookState();
}

class _RegisterEmailControllerHookState extends HookState<TextEditingController, _RegisterEmailControllerHook> {
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
  void didUpdateHook(_RegisterEmailControllerHook oldHook) {
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
    hook.ref.read(confirmPasswordControllerProvider.notifier).changeEmail(
          _controller.text,
        );
  }
}
