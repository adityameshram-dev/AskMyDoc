import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/profile_tile.dart';
import '../../auth/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showApiKeyDialog(BuildContext context) {
    final controller = TextEditingController();
    var obscureText = true;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('API Key'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Enter your API key'),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: 'Enter your API key',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => obscureText = !obscureText),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('API key saved locally.')),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Settings'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading: Icon(Icons.palette_outlined), title: Text('Appearance')),
              ListTile(leading: Icon(Icons.notifications_none), title: Text('Notifications')),
              ListTile(leading: Icon(Icons.delete_outline), title: Text('Clear Chat History')),
              ListTile(leading: Icon(Icons.info_outline), title: Text('About AskMyDoc')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Logout?'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: (isDark ? AppColors.black : AppColors.textPrimaryLight).withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: isDark ? AppColors.primarySoftDark : AppColors.primarySoftLight,
                    child: Icon(Icons.person, size: 32, color: AppColors.primary),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Aisha Khan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'research@askmydoc.com',
                        style: TextStyle(
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ListView(
                  children: [
                    ProfileTile(
                      icon: Icons.person_outline,
                      title: 'My Profile',
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('My Profile selected')),
                      ),
                    ),
                    ProfileTile(
                      icon: Icons.key_outlined,
                      title: 'API Key',
                      onTap: () => _showApiKeyDialog(context),
                    ),
                    ProfileTile(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () => _showSettings(context),
                    ),
                    ProfileTile(
                      icon: Icons.logout_rounded,
                      title: 'Logout',
                      color: AppColors.error,
                      onTap: () => _showLogoutDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}