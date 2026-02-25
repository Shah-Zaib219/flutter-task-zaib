import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Need support?',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: kcTitleColor,
            fontFamily: 'SF Pro Display',
          ),
        ),
        verticalSpaceSmall,
        Row(
          children: [
            Text(
              'If you need help, contact us on ',
              style: TextStyle(
                fontSize: 15.sp,
                color: kcSubtitleColor,
                fontFamily: 'SF Pro Display',
              ),
            ),
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: const BoxDecoration(
                color: Color(0xFF25D366), // WhatsApp Green
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 14.w,
              ),
            ),
            horizontalSpaceTiny,
            Text(
              'Whatsapp',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF25D366),
                fontFamily: 'SF Pro Display',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
