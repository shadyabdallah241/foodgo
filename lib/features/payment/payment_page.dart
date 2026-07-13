import 'package:flutter/material.dart';
import 'package:foodgo/core/constants/app_colors.dart';
import 'package:foodgo/core/constants/app_icons.dart';
import 'package:foodgo/core/constants/app_text_style.dart';

import '../popup/popup_message_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 16, fontWeight: .w500),
                ),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [Text("Order"), Text("\$16.48")],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [Text("Taxes"), Text("\$0.3")],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [Text("Delivery fees"), Text("\$1.5")],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Total", style: AppTextStyle.semiBold16),
                    Text("\$18.19", style: AppTextStyle.semiBold16),
                  ],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Estimated delivery time:",
                      style: AppTextStyle.semiBold14,
                    ),
                    Text("15 - 30mins", style: AppTextStyle.semiBold14),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Payment methods",
                      style: TextStyle(fontSize: 20, fontWeight: .w500),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                PaymentWidget(
                  id: 0,
                  icon: AppIcons.mastercard,
                  cardNumber: '5105 **** **** 0505',
                  cardName: "Credit card",
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                SizedBox(height: 12),
                PaymentWidget(
                  id: 1,
                  icon: AppIcons.visa,
                  cardNumber: '3566 **** **** 0505',
                  cardName: "Debit card",
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
              ],
            ),

            Row(
              children: [
                Checkbox(
                  checkColor: AppColors.onPrimary,
                  activeColor: AppColors.primary,
                  value: true,
                  onChanged: (value) {},
                ),
                SizedBox(width: 10),
                Text("Save card details for future payments"),
                SizedBox(height: 35),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Total price",
                      style: AppTextStyle.medium16.copyWith(
                        color: Color(0xff808080),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$",

                          style: AppTextStyle.semiBold32.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        Text("18.19", style: AppTextStyle.semiBold32),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopupMessagePage(),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainText,
                    ),
                    child: Text(
                      "Pay Now",
                      style: AppTextStyle.semiBold18.copyWith(
                        fontSize: 18,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.id,
    required this.icon,
    required this.cardNumber,
    required this.cardName,
    required this.isSelected,
    this.onTap,
  });
  final int id;
  final String icon;
  final String cardNumber;
  final String cardName;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.mainText : AppColors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 30,
                children: [
                  Image.asset(icon),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        cardName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Color(0xff808080),
                          fontSize: 14,
                          fontWeight: .w500,
                        ),
                      ),

                      Text(
                        cardNumber,
                        style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 14,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                  isSelected
                      ? Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
