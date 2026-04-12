import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBox2Screen extends StatefulWidget {
  const RotatingBox2Screen({super.key});

  @override
  State<RotatingBox2Screen> createState() => _RotatingBox2ScreenState();
}

class _RotatingBox2ScreenState extends State<RotatingBox2Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topRotationAnimation;
  late Animation<double> _rightRotationAnimation;
  late Animation<double> _bottomRotationAnimation;
  late Animation<double> _leftRotationAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _topRotationAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.25)));
    _rightRotationAnimation = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.25, 0.50)),
    );
    _bottomRotationAnimation = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.50, 0.75)),
    );
    _leftRotationAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.75, 1.0)));
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
      appBar: AppBar(title: const Text('Rotating Box 2')),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(_topRotationAnimation.value)
                    ..rotateY(_rightRotationAnimation.value)
                    ..rotateX(-_bottomRotationAnimation.value)
                    ..rotateY(-_leftRotationAnimation.value),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('Rotate me!')),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
