import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      // Search Bar
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(color: kcLightGrey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Where do you need internet?',
                            hintStyle: TextStyle(
                              color: kcMediumGrey,
                              fontSize: 14.sp,
                            ),
                            icon: Icon(
                              Icons.search,
                              color: kcMediumGrey,
                              size: 20.w,
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      // Selected Country Chip
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: kcHighlightColor,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.w,
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
                                Text(
                                  'Turkey',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kcTitleColor,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Icon(Icons.close,
                                    size: 16.w, color: kcMediumGrey),
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
                          _FilterChip(label: 'Standard', isActive: false),
                          horizontalSpaceSmall,
                          _FilterChip(label: 'Unlimited', isActive: false),
                        ],
                      ),
                      verticalSpaceMedium,
                      Text(
                        '${viewModel.bundles.length} Bundles Available for Turkey',
                        style: TextStyle(
                          fontSize: 16.sp,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
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
                      Text(
                        'Regional & Global Plans Supporting Turkey',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: kcTitleColor,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      verticalSpaceSmall,
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 12.h,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.r),
                          topRight: Radius.circular(25.r),
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
                            width: 40.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: kcLightGrey,
                              borderRadius: BorderRadius.circular(2.r),
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
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
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
                                                  TextSpan(
                                                    text: 'USD ',
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
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
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
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
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: kcSubtitleColor,
                                                fontFamily: 'SF Pro Display',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kcTitleColor,
                                              width: 1.2.w),
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.decrementQuantity(
                                                      item.bundle.id),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0.w),
                                                child: Icon(Icons.remove,
                                                    size: 14.w,
                                                    color: kcTitleColor),
                                              ),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'x${item.quantity}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp,
                                                color: kcTitleColor,
                                                fontFamily: 'SF Pro Display',
                                              ),
                                            ),
                                            SizedBox(width: 4.w),
                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.incrementQuantity(
                                                      item.bundle.id),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.0.w),
                                                child: Icon(Icons.add,
                                                    size: 14.w,
                                                    color: kcTitleColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.close,
                                            color: const Color(0xFFE57373),
                                            size: 20.w),
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
                            height: 50.h,
                            child: ElevatedButton(
                              onPressed: () {}, // Checkout action
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1EC896),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'USD ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                      ),
                                    ),
                                    TextSpan(
                                      text: viewModel.cartTotal
                                          .toStringAsFixed(1),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' - CHECKOUT',
                                      style: TextStyle(
                                        fontSize: 16.sp,
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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? kcPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: kcPrimaryColor, width: 1.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : kcPrimaryColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 15.sp,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }
}
