import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFCCE59D), // Navigation bar
      statusBarColor: Color.fromARGB(255, 233, 248, 204), // Status bar
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => const MaterialApp(
        title: 'Farming App',
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: OnBoardingPage(),
      ),
    );
  }
}
