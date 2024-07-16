import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leaderboard/src/providers/change_location_provider.dart';
import 'package:leaderboard/src/providers/data_controller.dart';
import 'package:leaderboard/src/widgets/leader_character.dart';
import 'package:provider/provider.dart';

class TopSideLeaderboard extends StatefulWidget {
  const TopSideLeaderboard({super.key});

  @override
  State<TopSideLeaderboard> createState() => _TopSideLeaderboardState();
}

class _TopSideLeaderboardState extends State<TopSideLeaderboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final location = Provider.of<ChangeLocationProvider>(context);
    final dataController = Provider.of<DataController>(context);

    return SizedBox(
      width: size.width,
      height: size.height * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Gap(size.height * 0.05),
              SizedBox(
                width: size.width * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        location.previousLocation();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      location.location,
                      style: const TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        location.nextLocation();
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Gap(size.height * 0.06),
              LeaderCharacter(
                source: dataController.firstSources[1],
              ),
            ],
          ),
          Gap(size.width * 0.05),
          Column(
            children: [
              Gap(size.height * 0.04),
              LeaderCharacter(
                first: true,
                source: dataController.firstSources[0],
              ),
            ],
          ),
          Gap(size.width * 0.05),
          Column(
            children: [
              Gap(size.height * 0.06),
              LeaderCharacter(
                source: dataController.firstSources[2],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: size.width * 0.15,
          )
        ],
      ),
    );
  }
}
