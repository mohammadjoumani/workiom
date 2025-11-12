import 'package:flutter/material.dart';

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
    this.powerByWidget,
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
  final Widget? powerByWidget;

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
        // backgroundColor: ColorManager.colorBackground,
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
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bottomNavigationBar ?? const SizedBox(),
              powerByWidget ?? const SizedBox(),
            ],
          ),
        ),

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
