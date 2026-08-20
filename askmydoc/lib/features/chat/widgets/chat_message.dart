import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../models/message_model.dart';

class ChatMessage extends StatelessWidget {
  final MessageModel message;

  const ChatMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isUser
              ? (isDark ? AppColors.userBubbleDark : AppColors.userBubbleLight)
              : (isDark ? AppColors.aiBubbleDark : AppColors.aiBubbleLight),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(isUser ? 18 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 18),
          ),
          border: Border.all(
            color: isUser ? AppColors.primary.withOpacity(0.35) : (isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          boxShadow: [
            BoxShadow(
              color: (isDark ? AppColors.black : AppColors.textPrimaryLight).withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser)
              Row(
                children: [
                  Icon(Icons.smart_toy_outlined, size: 14, color: AppColors.accent),
                  const SizedBox(width: 6),
                  Text(
                    'AskMyDoc',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 6),
            Text(
              message.text,
              style: TextStyle(
                color: isUser
                    ? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight)
                    : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}