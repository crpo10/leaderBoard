import 'package:flutter/material.dart';
import 'package:leaderboard/src/widgets/source_datatable.dart';

class BottomSideLeaderboard extends StatelessWidget {
  const BottomSideLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: size.width,
      height: size.height * 0.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: size.width * 0.45,
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SourceDataTable(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            width: size.width * 0.45,
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SourceDataTable(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
