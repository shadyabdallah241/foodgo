import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_images.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: .infinity,
              height: 240,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  Image.asset(AppImages.profileBurgerLeft),
                  Image.asset(AppImages.profileBurgerRight),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: .infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withAlpha(220),
                    Colors.pinkAccent.withAlpha(150),
                    AppColors.primary.withAlpha(200),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  clipBehavior: .none,
                  alignment: .topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35),
                        ),
                        color: AppColors.onPrimary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 16,
                          right: 16,
                          bottom: 30,
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 25),
                                    CustomTextField(
                                      hintText: "Enter your name",
                                      labelText: "Name",
                                    ),
                                    SizedBox(height: 25),
                                    CustomTextField(
                                      hintText: "Enter your Email",
                                      labelText: "Email",
                                    ),
                                    SizedBox(height: 25),
                                    CustomTextField(
                                      hintText: "Delivery address",
                                      labelText: "Delivery address",
                                    ),
                                    SizedBox(height: 25),
                                    CustomTextField(
                                      hintText: "Enter your Password",
                                      labelText: "Password",
                                      isPassword: true,
                                    ),
                                    SizedBox(height: 35),
                                    Divider(),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Text(
                                          "Payment Details",
                                          style: AppTextStyle.medium16,
                                        ),
                                        Spacer(),
                                        Icon(Icons.chevron_right_sharp),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Text(
                                          "Order history",
                                          style: AppTextStyle.medium16,
                                        ),
                                        Spacer(),
                                        Icon(Icons.chevron_right_sharp),
                                      ],
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment: .center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.red.withAlpha(
                                                  100,
                                                ),
                                                blurRadius: 15,
                                                offset: Offset(0, 8),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: AppColors.mainText,
                                          ),
                                          child: Row(
                                            spacing: 8,
                                            children: [
                                              Text(
                                                "Edit Profile",
                                                style: AppTextStyle.semiBold18
                                                    .copyWith(
                                                      fontSize: 18,
                                                      color:
                                                          AppColors.onPrimary,
                                                    ),
                                              ),

                                              Icon(
                                                Icons.edit,
                                                color: AppColors.onPrimary,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: AppColors.primary,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            spacing: 8,
                                            children: [
                                              Text(
                                                "Log out",
                                                style: AppTextStyle.semiBold18
                                                    .copyWith(
                                                      fontSize: 18,
                                                      color: AppColors.primary,
                                                    ),
                                              ),

                                              Icon(
                                                Icons.exit_to_app,
                                                color: AppColors.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withAlpha(100),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.primary,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primary,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          clipBehavior: .antiAlias,
                          child: Image.asset(AppImages.person2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: AppColors.onPrimary,
                              ),
                              Icon(Icons.settings, color: AppColors.onPrimary),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isPassword = false,
  });

  final String hintText;
  final String labelText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.grey, width: 2),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: AppTextStyle.medium16.copyWith(color: Color(0xff808080)),
        hintStyle: AppTextStyle.medium16.copyWith(color: Color(0xff3C2F2F)),
        filled: false,
      ),
    );
  }
}
