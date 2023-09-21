import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../feature/utils/colors.dart';

class WButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Color? color;
  final bool disabled;
  final Widget? leading;

  const WButton({
    super.key,
    required this.title,
    this.color,
    this.onTap,
    this.disabled = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        height: height * 0.06,
        decoration: BoxDecoration(
          color: !disabled ? AppColors.buttonColor : AppColors.tShadeColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            if (leading != null) SizedBox(width: width * 0.02),
            Text(
              title,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
              style: GoogleFonts.workSans(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
