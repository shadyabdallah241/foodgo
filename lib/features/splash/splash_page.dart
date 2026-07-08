import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/features/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Positioned(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [AppColors.primary, AppColors.onPrimary.withAlpha(50)],
          //         begin: .bottomCenter,
          //         end: .topCenter,
          //       ),
          //     ),
          //   ),
          //
          // ),
          Positioned(bottom: 0, child: Image.asset(AppImages.splashScreen)),
          Center(child: Image.asset(AppIcons.foodgoWhite)),
        ],
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(Duration(seconds: 3));
    if(!mounted){
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
