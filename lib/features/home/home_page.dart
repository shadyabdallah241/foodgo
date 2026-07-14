import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/core/constants/app_text_style.dart';
import 'package:foodgo/features/favorite/favorite_page.dart';
import 'package:foodgo/features/home/provider/favorite_provider.dart';
import 'package:foodgo/features/home/provider/search_provider.dart';
import 'package:foodgo/features/item_details/item_details.dart';

import '../customer_support/customer_support.dart';
import '../profile/profile_page.dart';

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
    final favoriteIds = ref.watch(favoriteProvider);
    final filteredBurgers = ref.watch(searchProvider);
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Image.asset(AppIcons.foodgoBlack),
                      const Spacer(),
                      Image.asset(AppImages.person),
                    ],
                  ),
                ),
                Text(
                  "Order your favourite food!",
                  style: AppTextStyle.medium18.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(30),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        ref.read(searchProvider.notifier).search(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
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
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(AppIcons.settingsSliders),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
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
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredBurgers.length,
              itemBuilder: (context, index) {
                final burger = filteredBurgers[index];
                return BurgerCard(
                  image: burger.image,
                  name: burger.name,
                  description: burger.shortDescription,
                  rate: burger.rating,
                  isFavorite: favoriteIds.contains(index),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetails(burger: burger),
                      ),
                    );
                  },
                  onFavoriteTap: () {
                    ref.read(favoriteProvider.notifier).toggleBurger(index);
                  },
                );
              },
            ),
          ),
          Container(
            height: 75,
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavBarItem(
                  icon: AppIcons.home,
                  isActive: true,
                  onTap: () {},
                ),
                _buildNavBarItem(
                  icon: AppIcons.user,
                  isActive: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
                _buildNavBarItem(
                  icon: AppIcons.comment,
                  isActive: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerSupport(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritePage(),
                    ),
                  ),
                  child: _buildNavBarItem(
                    icon: AppIcons.heart,
                    isActive: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem({
    required String icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(icon, color: Colors.white),
        ),
        if (isActive) ...[
          const SizedBox(height: 4),
          Container(
            height: 4,
            width: 4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ],
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.asset(image))),
            const SizedBox(height: 8),
            Text(
              name,
              style: AppTextStyle.semiBold16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              style: AppTextStyle.regular16.copyWith(fontSize: 12),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rate.toString(),
                  style: AppTextStyle.medium16.copyWith(fontSize: 14),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Image.asset(
                    isFavorite ? AppIcons.heart : AppIcons.heartOutline,
                    color: isFavorite ? AppColors.primary : Colors.grey,
                    width: 20,
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

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    this.onTap,
    required this.text,
    this.isSelected = false,
  });

  final VoidCallback? onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: AppTextStyle.medium16.copyWith(
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
