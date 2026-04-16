import 'package:flutter/material.dart';
import 'package:flutter_animations/features/animations/chained_circle_animation.dart';
import 'package:flutter_animations/features/animations/rotating_box_2_screen.dart';
import 'package:flutter_animations/features/animations/rotating_box_screen.dart';
import 'package:flutter_animations/features/animations/three_d_box_animation.dart';

import '../models/animation_item.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ADD YOUR ANIMATION DEMOS HERE
// Each entry shows up as a card on the home screen.
// The `builder` is called when the user taps the card.
// ─────────────────────────────────────────────────────────────────────────────

final List<AnimationItem> animationItems = [
  AnimationItem(
    id: 'rotating_box',
    title: 'Rotating Box',
    subtitle:
        'Spin a widget on the Y-axis using Matrix4 and AnimationController.',
    icon: Icons.crop_square_rounded,
    color: Colors.blue,
    tags: const ['Explicit', 'Matrix4', 'Transform'],
    builder: (_) => const RotatingBoxScreen(),
  ),
  AnimationItem(
    id: 'staggered_3d_box',
    title: 'Staggered 3D Box',
    subtitle:
        'A complex sequence of X and Y rotations using Intervals and Matrix4.',
    icon: Icons.view_in_ar_rounded,
    color: const Color(0xFF673AB7),
    tags: const ['Matrix4', 'Interval', 'Staggered'],
    builder: (_) => const RotatingBox2Screen(),
  ),
  AnimationItem(
    id: 'chained_circle_flip',
    title: 'Chained Circle Flip',
    subtitle:
        'Dynamic re-tweening on completion to create an infinite, evolving sequence.',
    icon: Icons.published_with_changes_rounded,
    color: Colors.pinkAccent,
    tags: const ['StatusListener', 'Dynamic Tween', 'Matrix4'],
    builder: (_) => const ChainedCircleAnimation(),
  ),
  AnimationItem(
    id: '3d_cube_assembly',
    title: '3D Cube Assembly',
    subtitle:
        'Constructing a 6-sided cube using Matrix4 folding and triple-axis de-synced rotation.',
    icon: Icons.view_in_ar_sharp,
    color: Colors.redAccent,
    tags: const ['3D', 'Matrix4', 'Stack', 'Multi-Controller'],
    builder: (_) => const ThreeDBoxAnimation(),
  ),
  AnimationItem(
    id: 'custom_paint',
    title: 'Custom Paint',
    subtitle: 'Draw and animate shapes using CustomPainter.',
    icon: Icons.draw_rounded,
    color: const Color(0xFF00B4D8),
    tags: const ['CustomPainter', 'Canvas'],
    builder: (_) => const _PlaceholderScreen(title: 'Custom Paint'),
  ),
];

// ── Placeholder screen ────────────────────────────────────────────────────────
// Delete this once you have replaced each item builder with a real screen.
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.construction_rounded,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Coming soon',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Replace this screen in animation_items.dart',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
