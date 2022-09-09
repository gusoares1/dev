import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextbuttonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  NextbuttonWidget({
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  });

  NextbuttonWidget.green({
    required String label,
    required VoidCallback onTap,
  })  : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.label = label;

  NextbuttonWidget.white({
    required String label,
    required VoidCallback onTap,
  })  : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.black,
        this.borderColor = AppColors.black,
        this.onTap = onTap,
        this.label = label;

  NextbuttonWidget.purple({
    required String label,
    required VoidCallback onTap,
  })  : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.onTap = onTap,
        this.label = label;

  NextbuttonWidget.Transparente({
    required String label,
    required VoidCallback onTap,
  })  : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.black,
        this.borderColor = Colors.transparent,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                backgroundColor,
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              side: MaterialStateProperty.all(BorderSide(color: borderColor))),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
