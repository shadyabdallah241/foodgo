import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_text_style.dart';


class PopupMessagePage extends StatelessWidget {
  const PopupMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2d2d2),
      body: AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,

        content: Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.15), // Shadow intensity
                spreadRadius: 0, // Spread distance
                blurRadius: 20, // Blur softness
                offset: const Offset(0, 10), // Shadow position (x, y)
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 32, 30),
              child: Column(
                children: [
                  Icon(Icons.check_circle, size: 90, color: AppColors.primary),
                  Text(
                    "Success !",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: .bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your payment was successful.\n A receipt for this purchase has \n been sent to your email.",
                    textAlign: .center,
                    style: AppTextStyle.regular14.copyWith(
                      color: Color(0xff808080),
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        "Go Back",
                        style: AppTextStyle.semiBold18.copyWith(
                          fontSize: 18,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
