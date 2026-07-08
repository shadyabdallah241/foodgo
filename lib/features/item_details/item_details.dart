import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/features/home/models/burger.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key, required this.burger});
  final Burger burger;
  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  double _currentDisreteSlider = 60.2;
  late PortionSize _currentPortion;
  @override
  void initState() {
    super.initState();
    _currentPortion = widget.burger.portion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(AppIcons.arrowLeft),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(AppIcons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          children: [
            Image.asset(widget.burger.image),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  widget.burger.name,
                  style: AppTextStyle.semiBold18.copyWith(fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star, color: CupertinoColors.systemYellow),
                Text("${widget.burger.rating}- ${widget.burger.duration} mins"),
              ],
            ),
            SizedBox(height: 15),
            Text(widget.burger.description),

            Row(
              children: [
                Expanded(
                  child: Padding(
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
                              style: AppTextStyle.medium14.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Hot",
                              style: AppTextStyle.medium14.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: .start,
                    children: [
                      Text("Portion", style: AppTextStyle.medium14),
                      Row(
                        mainAxisSize: .min,
                        spacing: 15,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _currentPortion =
                                      PortionSize
                                          .values[(_currentPortion.index + 1) %
                                          PortionSize.values.length];
                                });
                              },
                              child: Center(child: Icon(Icons.arrow_left)),
                            ),
                          ),
                          SizedBox(
                            width: 55,
                            child: Text(
                              _currentPortion.name,
                              style: AppTextStyle.medium14,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _currentPortion =
                                    PortionSize.values[(_currentPortion.index -
                                            1) %
                                        PortionSize.values.length];
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Icon(Icons.arrow_right)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                  ),
                  child: Text(
                    "8.24",
                    style: AppTextStyle.semiBold18.copyWith(
                      fontSize: 22,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainText,
                  ),
                  child: Text(
                    "ORDER NOW",
                    style: AppTextStyle.semiBold18.copyWith(
                      fontSize: 18,
                      color: AppColors.onPrimary,
                    ),
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
