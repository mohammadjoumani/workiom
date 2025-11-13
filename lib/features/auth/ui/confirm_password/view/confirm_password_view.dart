import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/core/app_widgets/app_scaffold_widget.dart';
import 'package:workiom/core/app_widgets/stay_organized_widget.dart';

import 'widgets/confirm_password_view_body.dart';

class ConfirmPasswordView extends StatelessWidget {
  const ConfirmPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _onPressedBackButton(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: const ConfirmPasswordViewBody(),
      bottomNavigationBar: const StayOrganizedWidget(),
    );
  }

  _onPressedBackButton(BuildContext context) {
    context.pop();
  }
}
