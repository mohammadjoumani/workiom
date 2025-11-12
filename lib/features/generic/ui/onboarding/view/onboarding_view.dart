import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_scaffold_widget.dart';
import 'package:workiom/core/app_widgets/stay_organized_widget.dart';

import 'widgets/onboarding_back_button_widget.dart';
import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBar(
        leading: const OnboardingBackButtonWidget(),
        leadingWidth: 100,
      ),
      body: const OnboardingViewBody(),
      bottomNavigationBar: const StayOrganizedWidget(),
    );
  }
}
