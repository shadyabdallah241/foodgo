import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/core/constants/app_text_style.dart';

import '../../core/constants/app_icons.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(AppIcons.arrowLeft),
        ),
        actions: [Image.asset(AppIcons.menu)],
        actionsPadding: EdgeInsets.only(right: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AgentWidget(message: "Hi, how can I help you?"),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                CustomerWidget(
                  message:
                      "Hello, I ordered two fried \n chicken burgers. can I\n know how much time it\n will get to arrive?",
                ),
              ],
            ),
            SizedBox(height: 30),
            AgentWidget(message: "Ok, please let me check!"),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [CustomerWidget(message: "Sure")],
            ),
            SizedBox(height: 15),
            AgentWidget(
              message: "It’ll get 25 minutes to \n arrive to your address",
            ),
            SizedBox(height: 12),
            Text(
              "26 minutes ago",
              style: AppTextStyle.semiBold14.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomerWidget(message: "Ok, thanks you for your\n support"),
              ],
            ),
            SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(30),
                        blurRadius: 15,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: .none,
                      ),
                      hintText: "Type here...",
                      hintStyle: AppTextStyle.medium18.copyWith(
                        color: Color(0xffDBDADA),
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          blurRadius: 15,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Image.asset(AppIcons.send),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AgentWidget extends StatelessWidget {
  const AgentWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(shape: .circle, color: AppColors.mainText),
          child: Image.asset(AppIcons.user),
        ),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(message, style: AppTextStyle.medium18),
        ),
      ],
    );
  }
}

class CustomerWidget extends StatelessWidget {
  const CustomerWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 15,
                offset: Offset(0, 7),
              ),
            ],
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            style: AppTextStyle.medium18.copyWith(color: AppColors.onPrimary),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: .circle,
            color: AppColors.mainText,
            border: Border.all(color: AppColors.primary, width: 3),
          ),
          child: ClipOval(child: Image.asset(AppImages.person)),
        ),
      ],
    );
  }
}
