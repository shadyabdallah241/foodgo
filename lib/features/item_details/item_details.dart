import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/core/widgets/portion_widget.dart';
import 'package:foodgo/core/widgets/slider_widget.dart';
import 'package:foodgo/features/customize/customize_page.dart';

import '../../core/models/burger.dart';

class ItemDetails extends ConsumerStatefulWidget {
  const ItemDetails({super.key, required this.burger});
  final Burger burger;

  @override
  ConsumerState<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends ConsumerState<ItemDetails> {
  late PortionSize _currentPortion;
  late double _basePrice;
  final double sliderValue=0;

  @override
  void initState() {
    super.initState();
    _currentPortion = widget.burger.portion;
    _basePrice = widget.burger.price;

  }

  double getPrice() {
    switch (_currentPortion) {
      case PortionSize.small:
        return _basePrice;
      case PortionSize.medium:
        return _basePrice + 2;
      case PortionSize.large:
        return _basePrice + 3;
    }
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
            onTap: () async {
              final PortionSize? newPortion = await Navigator.push<PortionSize>(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomizePage(
                    currentPortion: _currentPortion,
                    burger: widget.burger,
                  ),
                ),
              );

              if (newPortion != null) {
                setState(() {
                  _currentPortion = newPortion;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.mainText,
                ),
                child: Text(
                  "Customize",
                  style: AppTextStyle.semiBold18.copyWith(
                    fontSize: 12,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
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
                Expanded(child: MySlider(sliderValue: sliderValue,)),
                SizedBox(width: 15),
                Expanded(
                  child: PortionWidget(
                    currentPortion: _currentPortion,
                    onChanged: (PortionSize newSize) {
                      setState(() {
                        _currentPortion = newSize;
                      });
                    },
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
                    getPrice().toString(),
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
