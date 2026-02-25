import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_colors.dart';
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
        padding: EdgeInsets.all(1.2.w), // The border width
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(18.8.r), // Slightly smaller to fit inside
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Data Amount with Background
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: kcHighlightColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  bundle.dataAmount,
                  style: TextStyle(
                    color: kcTitleColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Valid for:',
                style: TextStyle(
                  color: kcSubtitleColor,
                  fontSize: 12.sp,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              Text(
                bundle.validity,
                style: TextStyle(
                  color: kcTitleColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              SizedBox(height: 8.h),
              const Divider(color: kcLightGrey, thickness: 2, height: 1),
              SizedBox(height: 12.h),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'USD ',
                        style: TextStyle(
                          color: kcPriceColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      TextSpan(
                        text: bundle.price.toStringAsFixed(2),
                        style: TextStyle(
                          color: kcPriceColor,
                          fontSize: 18.sp,
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
