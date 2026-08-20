import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ChatInput extends StatefulWidget {
  final ValueChanged<String>? onSend;
  final ValueChanged<String>? onUpload;

  const ChatInput({
    super.key,
    this.onSend,
    this.onUpload,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();

  void _showUploadMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final options = [
          {'label': 'PDF', 'icon': Icons.picture_as_pdf_rounded},
          {'label': 'DOCX', 'icon': Icons.description_outlined},
          {'label': 'Image', 'icon': Icons.image_outlined},
          {'label': 'Audio', 'icon': Icons.audiotrack_rounded},
        ];

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upload Document',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              ...options.map((option) {
                final label = option['label'] as String;
                final icon = option['icon'] as IconData;
                return ListTile(
                  leading: Icon(icon, color: const Color(0xFF4F46E5)),
                  title: Text(label),
                  onTap: () {
                    Navigator.pop(context);
                    widget.onUpload?.call(label);
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend?.call(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(isDark ? 0.12 : 0.08),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _showUploadMenu,
            icon: const Icon(Icons.add_circle_rounded, color: AppColors.primary),
            tooltip: 'Upload document',
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Ask about your documents...',
                hintStyle: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              ),
              onSubmitted: (_) => _submit(),
            ),
          ),
          IconButton(
            onPressed: _submit,
            icon: const Icon(Icons.arrow_upward_rounded, color: AppColors.white),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}