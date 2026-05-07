import 'package:flutter/material.dart';

class StaggeredEntranceScreen extends StatefulWidget {
  const StaggeredEntranceScreen({super.key});

  @override
  State<StaggeredEntranceScreen> createState() =>
      _StaggeredEntranceScreenState();
}

class _StaggeredEntranceScreenState extends State<StaggeredEntranceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _logoAnimation;
  late Animation<Offset> _titleAnimation;
  late Animation<Offset> _subtitleAnimation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.9, curve: Curves.easeIn),
    );

    _logoAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.35, curve: Curves.easeOutBack),
    );

    _titleAnimation = Tween<Offset>(begin: Offset(0, .5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 0.55, curve: Curves.easeOut),
          ),
        );

    _subtitleAnimation = Tween<Offset>(begin: Offset(0, .5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.45, 0.70, curve: Curves.easeOut),
          ),
        );

    _buttonAnimation = Tween<Offset>(
      begin: Offset(0, .5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(.62, .90)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _replay() {
    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(title: const Text('Staggered Entrance')),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _logoAnimation,
                        child: _Logo(),
                      ),
                    ),

                    const SizedBox(height: 48),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _titleAnimation,
                        child: _Title(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _subtitleAnimation,
                        child: _Subtitle(),
                      ),
                    ),

                    const SizedBox(height: 64),

                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _buttonAnimation,
                        child: _CTAButton(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                onPressed: _replay,
                icon: const Icon(Icons.replay_rounded, color: Colors.white38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF7F77DD).withValues(alpha: 0.15),
        border: Border.all(color: const Color(0xFF7F77DD), width: 2),
      ),
      child: const Icon(
        Icons.animation_rounded,
        color: Color(0xFF7F77DD),
        size: 44,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter Animate',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '30 days to animation mastery.\nOne challenge at a time.',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white54, fontSize: 16, height: 1.5),
    );
  }
}

class _CTAButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF7F77DD),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Start the challenge',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
