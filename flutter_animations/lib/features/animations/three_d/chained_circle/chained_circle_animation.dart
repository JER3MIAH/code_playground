import 'dart:math';

import 'package:flutter/material.dart';

class ChainedCircleAnimation extends StatefulWidget {
  const ChainedCircleAnimation({super.key});

  @override
  State<ChainedCircleAnimation> createState() => _ChainedCircleAnimationState();
}

class _ChainedCircleAnimationState extends State<ChainedCircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zAxisAnimation;
  late Animation<double> _xAxisAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward.delay();
    _zAxisAnimation = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.50, curve: Curves.bounceOut),
      ),
    );
    _xAxisAnimation = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.50, 1.0, curve: Curves.bounceOut),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _zAxisAnimation =
            Tween(
              begin: _zAxisAnimation.value,
              end: _zAxisAnimation.value + (pi / 2),
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 0.50, curve: Curves.bounceOut),
              ),
            );
        _xAxisAnimation =
            Tween(
              begin: _xAxisAnimation.value,
              end: _xAxisAnimation.value + pi,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(0.50, 1.0, curve: Curves.bounceOut),
              ),
            );

        _controller
          ..reset()
          ..forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chained Circle Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, _) {
            return Transform(
              alignment: .center,
              transform: Matrix4.identity()
                ..rotateZ(-_zAxisAnimation.value)
                ..rotateY(_xAxisAnimation.value),
              child: _CircleWidget(),
            );
          },
        ),
      ),
    );
  }
}

class _CircleWidget extends StatelessWidget {
  const _CircleWidget();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(100),
      child: Row(
        mainAxisSize: .min,
        children: [
          Container(height: 150, width: 75, color: Colors.blueAccent),
          Container(height: 150, width: 75, color: Colors.pinkAccent),
        ],
      ),
    );
  }
}

extension on VoidCallback {
  void delay() {
    Future.delayed(Duration(seconds: 1), () {
      this();
    });
  }
}
