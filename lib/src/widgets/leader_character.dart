import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:leaderboard/src/models/source_model.dart';
import 'package:leaderboard/src/models/sources_model.dart';
import 'package:leaderboard/src/widgets/crown_widget.dart';

class LeaderCharacter extends StatelessWidget {
  const LeaderCharacter({
    super.key,
    this.first = false,
    required this.source,
  });

  final bool first;
  final SourceModel source;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.15,
      height: size.height * 0.28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          first
              ? const CrownWidget(
                  crownColor: Colors.yellow,
                )
              : SizedBox(
                  width: size.width * 0.07,
                  height: size.height * 0.04,
                ),
          const Gap(5),
          SizedBox(
            height: size.height * 0.13,
            width: size.width * 0.13,
            child: Image.asset(
              'assets/no_user.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
            ),
          ),
          const Gap(5),
          first
              ? Container(
                  margin: const EdgeInsets.all(5),
                  width: size.width * 0.25,
                  child: FirstPlaceName(
                    size: size,
                    name: source.sourceName,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(5),
                  width: size.width * 0.25,
                  child: Text(
                    source.sourceName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Leads:  ',
                style: TextStyle(
                  fontSize: size.height * 0.020,
                  color: Colors.white,
                ),
              ),
              Text(
                source.leadCount.toString(),
                style: TextStyle(
                  fontSize: size.height * 0.025,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstPlaceName extends StatefulWidget {
  final Size size;

  final String name;

  const FirstPlaceName({super.key, required this.size, required this.name});

  @override
  _FirstPlaceNameState createState() => _FirstPlaceNameState();
}

class _FirstPlaceNameState extends State<FirstPlaceName>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _floatAnimation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 2, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _floatAnimation2 = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widget.size.width,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.amber,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors
                    .white, // This color won't be visible, the gradient will be applied
                fontSize: widget.size.height * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: 5,
        //   right: 80,
        //   child: AnimatedBuilder(
        //     animation: _floatAnimation2,
        //     builder: (context, child) {
        //       return Transform.translate(
        //         offset: Offset(0, _floatAnimation2.value),
        //         child: child,
        //       );
        //     },
        //     child: SizedBox(
        //       width: 10,
        //       height: 10,
        //       child: SvgPicture.asset(
        //         'assets/star-solid.svg',
        //         colorFilter:
        //             const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 10,
        //   left: 70,
        //   child: AnimatedBuilder(
        //     animation: _floatAnimation,
        //     builder: (context, child) {
        //       return Transform.translate(
        //         offset: Offset(0, _floatAnimation.value),
        //         child: child,
        //       );
        //     },
        //     child: SizedBox(
        //       width: 10,
        //       height: 10,
        //       child: SvgPicture.asset(
        //         'assets/star-solid.svg',
        //         colorFilter:
        //             const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
