import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:leaderboard/src/login/provider/login_provider.dart';
import 'package:leaderboard/src/preferences/user_preferences.dart';
import 'package:leaderboard/src/providers/change_location_provider.dart';
import 'package:leaderboard/src/providers/data_controller.dart';
import 'package:leaderboard/src/view/home_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeLocationProvider>(
          create: (BuildContext context) => ChangeLocationProvider(),
        ),
        ChangeNotifierProvider<DataController>(
          create: (BuildContext context) => DataController(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (BuildContext context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leader Board',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
