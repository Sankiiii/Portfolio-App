import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_assi/utils/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, 'assets/icons/home.svg', 'Home'),
          _buildNavItem(1, 'assets/icons/search.svg', 'Search'),
          _buildNavItem(2, 'assets/icons/message.svg', 'Messages'),
          _buildNavItem(3, 'assets/icons/profile.svg', 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final bool isSelected = currentIndex == index;
    
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Indicator
          Container(
            height: 2,
            width: 20,
            color: isSelected ? AppColors.primary : Colors.transparent,
            margin: EdgeInsets.only(bottom: 4),
          ),
          SizedBox(height: 2),
          // Icon
          SvgPicture.asset(
            iconPath,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : AppColors.textSecondary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 4),
          // Label
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}