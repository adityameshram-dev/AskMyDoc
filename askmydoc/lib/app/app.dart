import 'package:flutter/material.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/chat/screens/chat_screen.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AskMyDoc',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.chat: (context) => const ChatScreen(),
      },
    );
  }
}
