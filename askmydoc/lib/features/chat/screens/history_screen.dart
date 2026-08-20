import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = {
      'Today': ['What is this document about?', 'Explain chapter 3'],
      'Yesterday': ['Summarize my PDF', 'Find important dates'],
    };

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Chat History'),
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: sections.entries.expand((entry) {
          return [
            const SizedBox(height: 8),
            Text(
              entry.key,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 8),
            ...entry.value.map((item) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
              ),
              child: ListTile(
                leading: const Icon(Icons.history_rounded, color: AppColors.primary),
                title: Text(item, style: TextStyle(color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)),
                onTap: () {},
              ),
            )),
          ];
        }).toList(),
      ),
    );
  }
}