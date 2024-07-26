import 'package:flutter/material.dart';
import 'package:leaderboard/src/providers/data_controller.dart';
import 'package:leaderboard/src/widgets/source_datatable.dart';
import 'package:provider/provider.dart';

class BottomSideLeaderboard extends StatelessWidget {
  const BottomSideLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final dataProvider = Provider.of<DataController>(context);

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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SourceDataTable(
                sourcesData: dataProvider.firstSources,
              ),
            ),
          ),
          LastSourcesWidget(size: size, dataProvider: dataProvider),
        ],
      ),
    );
  }
}

class LastSourcesWidget extends StatefulWidget {
  const LastSourcesWidget({
    super.key,
    required this.size,
    required this.dataProvider,
  });

  final Size size;
  final DataController dataProvider;

  @override
  State<LastSourcesWidget> createState() => _LastSourcesWidgetState();
}

class _LastSourcesWidgetState extends State<LastSourcesWidget>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final minScrollExtent = _scrollController.position.minScrollExtent;
        final range = maxScrollExtent - minScrollExtent;
        final offset = _animation.value * range;
        _scrollController.jumpTo(offset);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      width: widget.size.width * 0.45,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SourceDataTable(
            sourcesData: widget.dataProvider.secondSources,
          ),
        ),
      ),
    );
  }
}
