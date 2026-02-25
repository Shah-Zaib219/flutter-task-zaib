import 'package:flutter/material.dart';
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
      width: (MediaQuery.of(context).size.width - 52) /
          2, // Slightly more width, smaller gaps
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: kcWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kcLightGrey.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Name with Background
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kcHighlightColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              plan.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kcTitleColor,
                fontSize: 16,
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
                        style: const TextStyle(
                          color: kcTitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      const TextSpan(
                        text: 'Supported Countries',
                        style: TextStyle(
                          color: kcTitleColor,
                          fontSize: 13,
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
                  const TextSpan(
                    text: 'USD ',
                    style: TextStyle(
                      color: kcPriceColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  TextSpan(
                    text: plan.price.toStringAsFixed(2),
                    style: const TextStyle(
                      color: kcPriceColor,
                      fontSize: 20,
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
          style: const TextStyle(
            color: kcSubtitleColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: kcTitleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF Pro Display',
          ),
        ),
      ],
    );
  }
}
