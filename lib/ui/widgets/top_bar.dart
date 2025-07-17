import 'package:flutter/material.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: AppColors.primary),
        const SizedBox(width: 4),
        const Text(
          "Guayaquil - Ecuador",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Image.asset(Assets.logo, width: 90, height: 40, fit: BoxFit.cover),
      ],
    );
  }
}
