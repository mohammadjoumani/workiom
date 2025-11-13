import 'package:flutter/material.dart';
import 'package:workiom/core/resource/color_manager.dart';

class AppScaffoldWidget extends StatelessWidget {
  const AppScaffoldWidget({
    super.key,
    this.canPop = true,
    this.onPopInvoked,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawer,
    this.userSafeArea = true,
  });

  final bool canPop;
  final Function? onPopInvoked;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool userSafeArea;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && onPopInvoked != null) {
          onPopInvoked!();
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.colorBackground,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar,
        body: body == null
            ? body
            : userSafeArea
                ? SafeArea(child: body!)
                : body,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Expanded(
          child: body == null
              ? const SizedBox()
              : userSafeArea
                  ? SafeArea(child: body!)
                  : const SizedBox(),
        ),
        const Text.rich(
          TextSpan(
            text: "Powered by Scarlet Code",
          ),
        ),
      ],
    );
  }
}
