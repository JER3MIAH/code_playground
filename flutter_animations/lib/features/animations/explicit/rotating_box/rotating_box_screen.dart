import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/features/shared/widgets/blue_container.dart';

class RotatingBoxScreen extends StatefulWidget {
  const RotatingBoxScreen({super.key});

  @override
  State<RotatingBoxScreen> createState() => _RotatingBoxScreenState();
}

class _RotatingBoxScreenState extends State<RotatingBoxScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
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
      appBar: AppBar(title: const Text('Rotating Box')),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(_rotationAnimation.value),
                  child: BlueContainer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
