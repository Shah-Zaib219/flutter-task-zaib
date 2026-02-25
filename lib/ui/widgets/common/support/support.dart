import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Need support?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kcTitleColor,
            fontFamily: 'SF Pro Display',
          ),
        ),
        verticalSpaceSmall,
        Row(
          children: [
            const Text(
              'If you need help, contact us on ',
              style: TextStyle(
                fontSize: 15,
                color: kcSubtitleColor,
                fontFamily: 'SF Pro Display',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF25D366), // WhatsApp Green
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
                size: 14,
              ),
            ),
            horizontalSpaceTiny,
            const Text(
              'Whatsapp',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25D366),
                fontFamily: 'SF Pro Display',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
