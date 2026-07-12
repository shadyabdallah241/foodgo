import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/features/home/provider/favorite_provider.dart';
import 'package:foodgo/features/item_details/item_details.dart';

import '../home/data/burgers.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    final favoriteBurgers = ref.watch(favoriteProvider);
    final favoriteList = burgers.where(
          (burger) => favoriteBurgers.contains(int.parse(burger.id)),
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Order"),
        backgroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.onPrimary,
      body: Column(
        children: [
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
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final burger = favoriteList[index];
                return BurgerCard(
                  image: burger.image,
                  name: burger.name,
                  description: burger.shortDescription,
                  rate: burger.rating,
                  isFavorite: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ItemDetails(burger: burger);
                        },
                      ),
                    );
                  },
                  onFavoriteTap: () {
                    ref.read(favoriteProvider.notifier).toggleBurger(int.parse(burger.id));
                  },
                );
              },
            ),
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
    this.onFavoriteTap,
    this.onTap,
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
