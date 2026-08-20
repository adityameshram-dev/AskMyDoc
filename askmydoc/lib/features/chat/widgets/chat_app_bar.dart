import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;

  const ChatAppBar({
    super.key,
    this.onMenuPressed,
    this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceDark,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onMenuPressed,
        icon: Icon(Icons.menu_rounded, color: AppColors.white),
        tooltip: 'Open menu',
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome_rounded, size: 18, color: AppColors.accent),
          const SizedBox(width: 8),
          const Text(
            'AskMyDoc',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onProfilePressed,
          icon: const Icon(Icons.account_circle_rounded, color: AppColors.white),
          tooltip: 'Profile',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}