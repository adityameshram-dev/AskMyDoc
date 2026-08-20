import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ChatDrawer extends StatelessWidget {
  final List<String> historyItems;
  final List<String> documents;
  final VoidCallback onNewChat;
  final ValueChanged<String>? onHistoryItemTap;

  const ChatDrawer({
    super.key,
    required this.historyItems,
    required this.documents,
    required this.onNewChat,
    this.onHistoryItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      width: 290,
      child: Container(
        color: isDark ? AppColors.sidebarDark : AppColors.sidebarLight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Row(
                  children: [
                    const Icon(Icons.auto_awesome_rounded, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      'AskMyDoc',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: onNewChat,
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('+ New Chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Chat History',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 12),
                ...historyItems.map((item) => ListTile(
                  dense: true,
                  leading: const Icon(Icons.chat_bubble_outline_rounded, size: 18, color: AppColors.primary),
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                  onTap: () => onHistoryItemTap?.call(item),
                )).toList(),
                const SizedBox(height: 24),
                Text(
                  'Documents',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 12),
                ...documents.map((item) => ListTile(
                  dense: true,
                  leading: const Icon(Icons.description_rounded, size: 18, color: AppColors.accent),
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}