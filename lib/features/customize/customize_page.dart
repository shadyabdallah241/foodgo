import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/core/widgets/portion_widget.dart';
import 'package:foodgo/core/widgets/slider_widget.dart';

import '../home/models/burger.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({
    super.key,
    required this.currentPortion,
    required this.burger,
  });
  final Burger burger;
  final PortionSize currentPortion;
  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  late PortionSize currentPortion;
  @override
  void initState() {
    super.initState();
    currentPortion = widget.currentPortion;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context,currentPortion);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Column(
        children: [
          Row(
            spacing: 40,
            children: [
              Image.asset(AppImages.customizeBurger),

              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Customize Your Burger\n to Your Tastes. Ultimate\n Experience",
                    ),
                    MySlider(),
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
        ],
      ),
    );
  }
}
