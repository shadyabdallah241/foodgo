import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_text_style.dart';

import '../models/burger.dart';

class PortionWidget extends StatelessWidget {
  const PortionWidget({
    super.key,
    required this.currentPortion,
    required this.onChanged,
  });

  final PortionSize currentPortion;
  final ValueChanged<PortionSize> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: .start,
      children: [
        Text("Portion", style: AppTextStyle.medium14),
        Row(
          mainAxisSize: .min,
          mainAxisAlignment: .spaceBetween,
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
                  final newPortion =
                      PortionSize.values[(currentPortion.index + 1) %
                          PortionSize.values.length];
                  onChanged(newPortion);
                },
                child: Center(child: Icon(Icons.arrow_left)),
              ),
            ),
            SizedBox(
              width: 55,
              child: Text(
                currentPortion.name.toString(),
                style: AppTextStyle.medium14,
              ),
            ),
            InkWell(
              onTap: () {
                final newPortion =
                    PortionSize.values[(currentPortion.index - 1) %
                        PortionSize.values.length];
                onChanged(newPortion);
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
    );
  }
}
