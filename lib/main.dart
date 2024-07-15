import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leaderboard/src/providers/change_location_provider.dart';
import 'package:leaderboard/src/view/home_view.dart';
import 'package:provider/provider.dart';

void main() {
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
        )
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
