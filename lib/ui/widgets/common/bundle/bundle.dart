import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import '../../../../models/bundle_model.dart';

class BundleCard extends StatelessWidget {
  final BundleModel bundle;
  final VoidCallback onTap;

  const BundleCard({
    Key? key,
    required this.bundle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: bundle.isSelected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF329CFB), Color(0xFF15D59D)],
                )
              : null,
          color: bundle.isSelected ? null : kcLightGrey,
        ),
        padding: const EdgeInsets.all(1.2), // The border width
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(18.8), // Slightly smaller to fit inside
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Data Amount with Background
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kcHighlightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  bundle.dataAmount,
                  style: const TextStyle(
                    color: kcTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
              verticalSpaceSmall,
              const Text(
                'Valid for:',
                style: TextStyle(
                  color: kcSubtitleColor,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              Text(
                bundle.validity,
                style: const TextStyle(
                  color: kcTitleColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              const SizedBox(height: 10),
              // verticalSpaceTiny,
              const Divider(color: kcLightGrey, thickness: 2, height: 1),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'USD ',
                        style: TextStyle(
                          color: kcPriceColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      TextSpan(
                        text: bundle.price.toStringAsFixed(2),
                        style: const TextStyle(
                          color: kcPriceColor,
                          fontSize: 18,
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
        ),
      ),
    );
  }
}
