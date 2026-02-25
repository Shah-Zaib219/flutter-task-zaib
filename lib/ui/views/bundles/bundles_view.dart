import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'bundles_viewmodel.dart';
import '../../widgets/common/bundle/bundle.dart';
import '../../widgets/common/plan/plan.dart';
import '../../widgets/common/app_bar/app_bar.dart';
import '../../widgets/common/support/support.dart';

class BundlesView extends StackedView<BundlesViewModel> {
  const BundlesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BundlesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BundlesAppBar(
        onCartPressed: viewModel.showCart,
      ),
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(color: kcPrimaryColor))
          : Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kcLightGrey),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Where do you need internet?',
                            hintStyle: TextStyle(color: kcMediumGrey),
                            icon: Icon(Icons.search, color: kcMediumGrey),
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      // Selected Country Chip
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: kcHighlightColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/turkey.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                horizontalSpaceSmall,
                                const Text(
                                  'Turkey',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kcTitleColor,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                                horizontalSpaceSmall,
                                const Icon(Icons.close,
                                    size: 16, color: kcMediumGrey),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      // Filter Chips
                      Row(
                        children: [
                          _FilterChip(label: 'All', isActive: true),
                          horizontalSpaceSmall,
                          const _FilterChip(label: 'Standard', isActive: false),
                          horizontalSpaceSmall,
                          const _FilterChip(
                              label: 'Unlimited', isActive: false),
                        ],
                      ),
                      verticalSpaceMedium,
                      Text(
                        '${viewModel.bundles.length} Bundles Available for Turkey',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcTitleColor,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      verticalSpaceSmall,
                      // Bundle Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: viewModel.bundles.length,
                        itemBuilder: (context, index) {
                          final bundle = viewModel.bundles[index];
                          return BundleCard(
                            bundle: bundle.copyWith(
                                isSelected: viewModel.isSelected(bundle.id)),
                            onTap: () =>
                                viewModel.toggleBundleSelection(bundle),
                          );
                        },
                      ),
                      verticalSpaceMedium,
                      const Text(
                        'Regional & Global Plans Supporting Turkey',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcTitleColor,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      verticalSpaceSmall,
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: viewModel.plans
                            .map((plan) => PlanCard(plan: plan))
                            .toList(),
                      ),
                      verticalSpaceMedium,
                      const SupportSection(),
                      verticalSpaceLarge,
                      if (viewModel.cartCount > 0) verticalSpaceMassive,
                    ],
                  ),
                ),
                if (viewModel.cartCount > 0)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          verticalSpaceSmall,
                          Flexible(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: viewModel.cartItems.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(color: kcCardBorderColor),
                              itemBuilder: (context, index) {
                                final item = viewModel.cartItems[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  const TextSpan(
                                                    text: 'USD ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kcPriceColor,
                                                      fontFamily:
                                                          'SF Pro Display',
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: item.bundle.price
                                                        .toStringAsFixed(2),
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kcPriceColor,
                                                      fontFamily:
                                                          'SF Pro Display',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              '${item.bundle.dataAmount} / ${item.bundle.validity}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: kcSubtitleColor,
                                                fontFamily: 'SF Pro Display',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kcTitleColor, width: 1.2),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.decrementQuantity(
                                                      item.bundle.id),
                                              child: const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Icon(Icons.remove,
                                                    size: 14,
                                                    color: kcTitleColor),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'x${item.quantity}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: kcTitleColor,
                                                fontFamily: 'SF Pro Display',
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.incrementQuantity(
                                                      item.bundle.id),
                                              child: const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Icon(Icons.add,
                                                    size: 14,
                                                    color: kcTitleColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close,
                                            color: Color(0xFFE57373), size: 20),
                                        onPressed: () => viewModel
                                            .removeItem(item.bundle.id),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          verticalSpaceSmall,
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {}, // Checkout action
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1EC896),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'USD ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                      ),
                                    ),
                                    TextSpan(
                                      text: viewModel.cartTotal
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' - CHECKOUT',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  @override
  BundlesViewModel viewModelBuilder(BuildContext context) => BundlesViewModel();

  @override
  void onViewModelReady(BundlesViewModel viewModel) => viewModel.init();
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const _FilterChip({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? kcPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: kcPrimaryColor, width: 1.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : kcPrimaryColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 15,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }
}
