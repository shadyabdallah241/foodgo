import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_text_style.dart';

class MySlider extends StatefulWidget {
   const MySlider({super.key});
  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentDisreteSlider = 60.2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          Text("Spicy", style: AppTextStyle.medium14),
          Slider(
            padding: EdgeInsets.all(0),
            value: _currentDisreteSlider,
            max: 100,
            divisions: 3,
            activeColor: AppColors.primary,
            onChanged: (value) {
              setState(() {
                _currentDisreteSlider = value;
               
              });



            },
          ),
          Row(
            children: [
              Text(
                "Mild",
                style: AppTextStyle.medium14.copyWith(color: AppColors.green),
              ),
              Spacer(),
              Text(
                "Hot",
                style: AppTextStyle.medium14.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
