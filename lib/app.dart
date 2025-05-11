import 'package:flutter/material.dart';
import 'package:shoppin/core/theme/app_themes.dart';
import 'package:shoppin/routes/app_router.dart';
import '/screen/home_screen.dart';
class Shopin extends StatelessWidget {
  const Shopin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
    );
  }
}
