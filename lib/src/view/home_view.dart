import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/src/login/login_view.dart';
import 'package:leaderboard/src/login/provider/login_provider.dart';
import 'package:leaderboard/src/preferences/user_preferences.dart';
import 'package:leaderboard/src/providers/change_location_provider.dart';
import 'package:leaderboard/src/providers/data_controller.dart';
import 'package:leaderboard/src/widgets/botton_side_leaderboard.dart';
import 'package:leaderboard/src/widgets/top_side_leaderboard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sourceProvider = Provider.of<DataController>(context);
    final locationProvider = Provider.of<ChangeLocationProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    final _prefs = UserPreferences();
    // Future.microtask(
    //     () => Provider.of<DataController>(context, listen: false).getSources());

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'assets/i_w_4.png',
              fit: BoxFit.cover,
              frameBuilder: (BuildContext context, Widget child, int? frame,
                  bool wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded || frame != null) {
                  return child;
                } else {
                  return Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.white,
                    child: const Center(child: LinearProgressIndicator()),
                  );
                }
              },
            ),
          ),
          _prefs.token != null
              ? FutureBuilder(
                  future:
                      sourceProvider.getSources(locationProvider.locationId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading data'),
                      );
                    } else if (snapshot.data!.isNotEmpty) {
                      return FadeIn(
                        child: Column(
                          children: [
                            const TopSideLeaderboard(),
                            SizedBox(
                              width: size.width,
                              child: Text(
                                'Leaderboard',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.05,
                                ),
                              ),
                            ),
                            const BottomSideLeaderboard(),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Error loading data'),
                      );
                    }
                  },
                )
              : loginProvider.cargando
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const LoginView(),
        ],
      ),
    );
  }
}
