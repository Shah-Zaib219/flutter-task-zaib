import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import '../../../../models/plan_model.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;

  const PlanCard({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (1.sw - 52.w) / 2, // Slightly more width, smaller gaps
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: kcWhite,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: kcLightGrey.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Name with Background
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: kcHighlightColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text(
              plan.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kcTitleColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
          verticalSpaceMedium,
          // Data and Validity row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoColumn(label: 'Data:', value: plan.dataAmount),
              _InfoColumn(
                label: 'Valid for:',
                value: plan.validity,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          ),
          verticalSpaceSmall,
          const Divider(color: kcLightGrey, thickness: 1, height: 1),
          verticalSpaceSmall,
          // Supported Countries row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${plan.supportedCountriesCount} ',
                        style: TextStyle(
                          color: kcTitleColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      TextSpan(
                        text: 'Supported Countries',
                        style: TextStyle(
                          color: kcTitleColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: kcMediumGrey, size: 20),
            ],
          ),
          verticalSpaceSmall,
          const Divider(color: kcLightGrey, thickness: 1, height: 1),
          verticalSpaceMedium,
          // Price matching bundle card style
          FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'USD ',
                    style: TextStyle(
                      color: kcPriceColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  TextSpan(
                    text: plan.price.toStringAsFixed(2),
                    style: TextStyle(
                      color: kcPriceColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
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
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;

  const _InfoColumn({
    required this.label,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          style: TextStyle(
            color: kcSubtitleColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: kcTitleColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
      ],
    );
  }
}
