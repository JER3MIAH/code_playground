import 'dart:math';

import 'package:flutter/material.dart';

class ThreeDBoxAnimation extends StatefulWidget {
  const ThreeDBoxAnimation({super.key});

  @override
  State<ThreeDBoxAnimation> createState() => _ThreeDBoxAnimationState();
}

class _ThreeDBoxAnimationState extends State<ThreeDBoxAnimation>
    with TickerProviderStateMixin {
  late AnimationController _xAxisController;
  late AnimationController _yAxisController;
  late AnimationController _zAxisController;

  late Animation<double> _xAxisAnimation;
  late Animation<double> _yAxisAnimation;
  late Animation<double> _zAxisAnimation;

  @override
  void initState() {
    _xAxisController =
        AnimationController(vsync: this, duration: Duration(seconds: 20))
          ..reset()
          ..repeat();
    _yAxisController =
        AnimationController(vsync: this, duration: Duration(seconds: 30))
          ..reset()
          ..repeat();
    _zAxisController =
        AnimationController(vsync: this, duration: Duration(seconds: 40))
          ..reset()
          ..repeat();

    _xAxisAnimation = Tween<double>(
      begin: 0.0,
      end: pi * 2,
    ).animate(_xAxisController);
    _yAxisAnimation = Tween<double>(
      begin: 0.0,
      end: pi * 2,
    ).animate(_yAxisController);
    _zAxisAnimation = Tween<double>(
      begin: 0.0,
      end: pi * 2,
    ).animate(_zAxisController);
    super.initState();
  }

  @override
  void dispose() {
    _xAxisController.dispose();
    _yAxisController.dispose();
    _zAxisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3D Cube Assembly')),
      body: Center(
        child: AnimatedBuilder(
          animation: _zAxisController,
          builder: (_, _) {
            return Transform(
              alignment: .center,
              transform: Matrix4.identity()..rotateZ(_zAxisAnimation.value),
              child: AnimatedBuilder(
                animation: _yAxisController,
                builder: (_, _) {
                  return Transform(
                    alignment: .center,
                    transform: Matrix4.identity()
                      ..rotateY(_yAxisAnimation.value),
                    child: AnimatedBuilder(
                      animation: _xAxisController,
                      builder: (_, _) {
                        return Transform(
                          alignment: .center,
                          transform: Matrix4.identity()
                            ..rotateX(_xAxisAnimation.value),
                          child: _ThreedBoxContainer(),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ThreedBoxContainer extends StatelessWidget {
  const _ThreedBoxContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BoxContainer(
          color: Colors.redAccent,
          alignment: null,
          transform: null,
        ),
        _BoxContainer(
          color: Colors.greenAccent,
          alignment: .centerLeft,
          transform: Matrix4.identity()..rotateY(-(pi / 2)),
        ),
        _BoxContainer(
          color: Colors.blueAccent,
          alignment: .centerRight,
          transform: Matrix4.identity()..rotateY((pi / 2)),
        ),
        _BoxContainer(
          color: Colors.purpleAccent,
          alignment: .bottomCenter,
          transform: Matrix4.identity()..rotateX(-(pi / 2)),
        ),
        _BoxContainer(
          color: Colors.pinkAccent,
          alignment: .topCenter,
          transform: Matrix4.identity()..rotateX((pi / 2)),
        ),
        _BoxContainer(color: Colors.blueGrey, alignment: null, transform: null),
      ],
    );
  }
}

class _BoxContainer extends StatelessWidget {
  final Color color;
  final Matrix4? transform;
  final AlignmentGeometry? alignment;
  const _BoxContainer({
    required this.color,
    required this.transform,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final box = DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: SizedBox(height: 100, width: 100),
    );
    if (transform == null) {
      return box;
    }
    return Transform(alignment: alignment, transform: transform!, child: box);
  }
}
