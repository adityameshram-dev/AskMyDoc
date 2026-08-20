import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? color;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (color ?? (isDark ? AppColors.primarySoftDark : AppColors.primarySoftLight)).withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color ?? AppColors.primary),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}