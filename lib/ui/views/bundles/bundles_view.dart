import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bundles_viewmodel.dart';

class BundlesView extends StackedView<BundlesViewModel> {
  const BundlesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BundlesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BundlesView")),
      ),
    );
  }

  @override
  BundlesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BundlesViewModel();
}
