import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:leaderboard/src/providers/data_controller.dart';
import 'package:leaderboard/src/widgets/botton_side_leaderboard.dart';
import 'package:leaderboard/src/widgets/top_side_leaderboard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<void> _loadData() async {
    // Simulate a network call or data loading
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future.microtask(() => Provider.of<DataController>(context, listen: false)
        .assignDataToEachList());

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data'),
            );
          } else {
            return Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image.asset(
                    'assets/i_w_2.png',
                    fit: BoxFit.cover,
                    frameBuilder: (BuildContext context, Widget child,
                        int? frame, bool wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded || frame != null) {
                        return child;
                      } else {
                        return Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.white,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const TopSideLeaderboard(),
                    SizedBox(
                      width: size.width,
                      child: Text(
                        'Cases Leaderboard',
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
              ],
            );
          }
        },
      ),
    );
  }
}
