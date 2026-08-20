import 'dart:async';

import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../models/message_model.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_drawer.dart';
import '../widgets/chat_input.dart';
import '../widgets/chat_message.dart';
import '../../profile/screens/profile_screen.dart';
import 'history_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _historyItems = [
    'What is this document about?',
    'Explain chapter 3',
    'Summarize my PDF',
  ];

  final List<String> _documents = [
    'research.pdf',
    'assignment.pdf',
    'notes.docx',
  ];

  final List<MessageModel> _messages = [];
  bool _isThinking = false;

  void _handleSend(String text) {
    final userMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(userMessage);
      _isThinking = true;
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        _messages.add(
          MessageModel(
            id: '${DateTime.now().millisecondsSinceEpoch}-ai',
            text: 'I\'m processing your question...\nI can help you summarize this document and answer questions from the uploaded files.',
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        _isThinking = false;
      });
    });
  }

  void _handleUpload(String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$type upload selected')),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  void _showHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoryScreen()),
    );
  }

  void _startNewChat() {
    setState(() {
      _messages.clear();
      _isThinking = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: ChatAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onProfilePressed: _openProfile,
      ),
      drawer: ChatDrawer(
        historyItems: _historyItems,
        documents: _documents,
        onNewChat: _startNewChat,
        onHistoryItemTap: (_) => _showHistory(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                      itemCount: _messages.length + (_isThinking ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_isThinking && index == _messages.length) {
                          return _buildThinkingBubble();
                        }
                        return ChatMessage(message: _messages[index]);
                      },
                    ),
            ),
            ChatInput(
              onSend: _handleSend,
              onUpload: _handleUpload,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome_rounded,
              size: 68,
              color: AppColors.primary,
            ),
            const SizedBox(height: 18),
            Text(
              'AskMyDoc',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your documents, understood.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Upload a document and ask questions\nto find answers from your files.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThinkingBubble() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.aiBubbleDark : AppColors.aiBubbleLight,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: const Radius.circular(4),
            bottomRight: const Radius.circular(18),
          ),
          border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 10),
            Text(
              'Processing...',
              style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
            ),
          ],
        ),
      ),
    );
  }
}