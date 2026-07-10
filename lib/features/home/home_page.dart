import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/features/home/provider/favorite_provider.dart';
import 'package:foodgo/features/item_details/item_details.dart';

import '../../core/models/burger.dart';
import 'data/burgers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentSelected = 0;

  final List<String> categories = [
    "All",
    "Combos",
    "Veggie",
    "Fried",
    "Chicken",
  ];
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProvider);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () {},

          backgroundColor: AppColors.primary,

          foregroundColor: Colors.white,

          elevation: 8,

          tooltip: "Add Item",

          shape: const CircleBorder(),

          heroTag: "addButton",

          child: Image.asset(AppIcons.add),
        ),
      ),
      backgroundColor: AppColors.onPrimary,
      body: Column(
        children: [
          Column(
            crossAxisAlignment: .stretch,
            children: [
              Row(
                children: [
                  Image.asset(AppIcons.foodgoBlack),
                  Spacer(),
                  Image.asset(AppImages.person),
                ],
              ),
              Text(

                "Order your favourite food!",
                style: AppTextStyle.medium18.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 45),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(30),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: .none,
                      ),
                      hintText: "Search",
                      hintStyle: AppTextStyle.medium18.copyWith(
                        color: AppColors.mainText,
                      ),
                      filled: true,
                      fillColor: AppColors.onPrimary,
                      prefixIcon: Image.asset(
                        AppIcons.search,
                        color: AppColors.mainText,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(AppIcons.settingsSliders),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          SizedBox(
            height: 70,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 12);
              },
              itemCount: categories.length,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              scrollDirection: .horizontal,

              itemBuilder: (context, index) {
                return CategoryButton(
                  text: categories[index],
                  isSelected: currentSelected == index,
                  onTap: () {
                    setState(() {
                      currentSelected = index;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: burgers.length,
              itemBuilder: (context, index) {
                final Burger burger = burgers[index];
                return BurgerCard(
                  image: burger.image,
                  name: burger.name,
                  description: burger.shortDescription,
                  rate: burger.rating,
                  isFavorite: favorites.contains(burger.id),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ItemDetails(burger: burger);
                    },));
                  },
                  onFavoriteTap: () {
                    ref.read(favoriteProvider.notifier).toggleBurger(burger.id);
                  },
                );
              },
            ),
          ),
          Stack(

            children: [
              Container(
                height: 75,
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: .spaceAround,

                    children: [
                      Column(

                        spacing: 10,
                        children: [
                          Image.asset(AppIcons.home),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Image.asset(AppIcons.user),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Image.asset(AppIcons.comment),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Image.asset(AppIcons.heart),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final double rate;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  const BurgerCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.rate,
    this.isFavorite = false,
    this.onFavoriteTap, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.onPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Center(child: Image.asset(image)),
              Text(name, style: AppTextStyle.semiBold16),
              Text(description, style: AppTextStyle.regular16),
              SizedBox(height: 10),
              Row(
                mainAxisSize: .min,
                children: [
                  Icon(Icons.star, color: CupertinoColors.systemYellow),
                  Text(rate.toString(), style: AppTextStyle.medium16),
                  Spacer(),
                  GestureDetector(
                    onTap: onFavoriteTap,
                    child: Image.asset(
                      !isFavorite ? AppIcons.heartOutline : AppIcons.heart,
                      color: isFavorite
                          ? AppColors.primary
                          : AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    this.onTap,
    required this.text,
    this.isSelected = false,
  });
  final void Function()? onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: .center,
        padding: EdgeInsets.symmetric(horizontal: 26),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.grey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          text,
          style: AppTextStyle.medium16.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
