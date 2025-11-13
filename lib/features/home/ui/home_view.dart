import 'package:flutter/material.dart';
import 'package:workiom/core/app_widgets/app_scaffold_widget.dart';
import 'package:workiom/core/app_widgets/stay_organized_widget.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      body: HomeViewBody(),
      bottomNavigationBar: StayOrganizedWidget(),
    );
  }
}
