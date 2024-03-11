import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/navigations/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontSize: 11,
          ),
          selectedItemColor: AppColor.mainOrangeColor,
        ),
        primaryColor: AppColor.mainOrangeColor,
      ),
      routerConfig: router,
    );
  }
}
