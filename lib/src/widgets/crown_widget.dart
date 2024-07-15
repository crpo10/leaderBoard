import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CrownWidget extends StatefulWidget {
  const CrownWidget({Key? key, required this.crownColor}) : super(key: key);

  final Color crownColor;

  @override
  _CrownWidgetState createState() => _CrownWidgetState();
}

class _CrownWidgetState extends State<CrownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _vibrateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _vibrateAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FadeIn(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_vibrateAnimation.value, _floatAnimation.value),
            child: SizedBox(
              width: size.width * 0.07,
              height: size.height * 0.04,
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: SvgPicture.asset(
                  'assets/crown-solid.svg',
                  colorFilter:
                      ColorFilter.mode(widget.crownColor, BlendMode.srcIn),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
