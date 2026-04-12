import 'package:flutter/material.dart';

import '../models/animation_item.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ADD YOUR ANIMATION DEMOS HERE
// Each entry shows up as a card on the home screen.
// The `builder` is called when the user taps the card.
// ─────────────────────────────────────────────────────────────────────────────

final List<AnimationItem> animationItems = [
  AnimationItem(
    id: 'fade',
    title: 'Fade Transition',
    subtitle: 'Animate opacity from 0 → 1 with AnimatedOpacity.',
    icon: Icons.blur_on_rounded,
    color: const Color(0xFFE94560),
    tags: const ['Implicit', 'Opacity'],
    builder: (_) => const _PlaceholderScreen(title: 'Fade Transition'),
  ),
  AnimationItem(
    id: 'slide',
    title: 'Slide Transition',
    subtitle: 'Slide a widget in from off-screen using SlideTransition.',
    icon: Icons.swipe_right_alt_rounded,
    color: const Color(0xFF5B4FCF),
    tags: const ['Explicit', 'Tween'],
    builder: (_) => const _PlaceholderScreen(title: 'Slide Transition'),
  ),
  AnimationItem(
    id: 'hero',
    title: 'Hero Animation',
    subtitle: 'Shared element transitions between routes with Hero widget.',
    icon: Icons.open_in_full_rounded,
    color: const Color(0xFF0F9D58),
    tags: const ['Hero', 'Route'],
    builder: (_) => const _PlaceholderScreen(title: 'Hero Animation'),
  ),
  AnimationItem(
    id: 'stagger',
    title: 'Staggered List',
    subtitle: 'Delay each item\'s entrance for a cascading reveal effect.',
    icon: Icons.format_list_bulleted_rounded,
    color: const Color(0xFFFF6B35),
    tags: const ['Stagger', 'Interval'],
    builder: (_) => const _PlaceholderScreen(title: 'Staggered List'),
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
            const Icon(Icons.construction_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text('Coming soon', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Replace this screen in animation_items.dart', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
