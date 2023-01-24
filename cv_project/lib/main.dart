// import 'package:cv_project/responsive/mobile.dart';
import 'package:cv_project/responsive/responsive_layout.dart';
// import 'package:cv_project/responsive/tablet.dart';
import 'package:cv_project/responsive/web.dart';
import 'package:cv_project/widgets/mobile_drawer_screen.dart';
import 'package:flutter/material.dart';
import 'tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enes Dorukbaşı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: neogPrimaryColor,
      ),
      home: const ResponsiveLayout(
        mobileScaffold: MobileDrawerScreen(),
        tabletScaffold: MobileDrawerScreen(),
        webScaffold: WebScaffold(),
      ),
    );
  }
}
