
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/core/widgets/portion_widget.dart';
import 'package:foodgo/core/widgets/slider_widget.dart';
import 'package:foodgo/features/customize/model/extra.dart';
import 'package:foodgo/features/customize/provider/extras_provider.dart';
import '../../core/models/burger.dart';

class CustomizePage extends ConsumerStatefulWidget {
  const CustomizePage({
    super.key,
    required this.currentPortion,
    required this.burger,
  });
  final Burger burger;
  final PortionSize currentPortion;

  @override
  ConsumerState<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends ConsumerState<CustomizePage> {
  late PortionSize currentPortion;
  final double sliderValue = 0;
  @override
  void initState() {
    super.initState();
    currentPortion = widget.currentPortion;
  }

  @override
  Widget build(BuildContext context) {
    final extras = ref.watch(extrasProvider);
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, currentPortion);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              spacing: 20,
              children: [
                Image.asset(AppImages.customizeBurger),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Customize Your Burger\n to Your Tastes. Ultimate\n Experience",
                      ),
                      MySlider(sliderValue: sliderValue),
                      PortionWidget(
                        currentPortion: currentPortion,
                        onChanged: (PortionSize newSize) {
                          setState(() {
                            setState(() {
                              currentPortion = newSize;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(children: [Text("Toppings", style: AppTextStyle.semiBold18)]),
            SizedBox(height: 15),
            SizedBox(
              height: 110,
              child: ListView.separated(
                clipBehavior: .none,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },

                itemCount: toppings.length,
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  final topping = toppings[index];
                  final isAdded = extras.any((e) => e.id == topping.id);
                  return MyCustomize(
                    id: index.toString(),
                    name: topping.name,
                    image: topping.image,
                    isChecked: isAdded,
                    onTap: () {
                      ref.read(extrasProvider.notifier).toggleExtra(topping);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [Text("Side options", style: AppTextStyle.semiBold18)],
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 110,
              child: ListView.separated(
                clipBehavior: .none,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },

                itemCount: sideOptions.length,
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  final sideOption = sideOptions[index];
                  final isAdded = extras.any((e) => e.id == sideOption.id);

                  return MyCustomize(
                    id: index.toString(),
                    name: sideOption.name,
                    image: sideOption.image,
                    isChecked: isAdded,
                    onTap: () {
                      ref.read(extrasProvider.notifier).toggleExtra(sideOption);
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Total", style: AppTextStyle.semiBold18),
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: AppTextStyle.medium18.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        Text("16.49", style: AppTextStyle.semiBold32),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
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

class MyCustomize extends StatelessWidget {
  const MyCustomize({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    this.isChecked = false,
    required this.onTap,
  });
  final String id;
  final String name;
  final String image;
  final bool isChecked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 84,
              decoration: BoxDecoration(
                color: AppColors.mainText,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 13, left: 5, right: 5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: .spaceBetween,

                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.onPrimary,
                          fontWeight: .w500,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: Image.asset(
                          isChecked ? AppIcons.checked : AppIcons.add,
                          width: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 84,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
