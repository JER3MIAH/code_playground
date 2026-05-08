// ─── Animation categories ─────────────────────────────────────────────────────
// explicit/   → AnimationController + Tween (full manual control)
// implicit/   → AnimatedContainer, TweenAnimationBuilder (flutter-driven)
// three_d/    → Matrix4 perspective transforms
// staggered/  → Interval-based multi-element orchestration
// physics/    → Spring, friction, gravity simulations
// gestures/   → Drag, swipe, scroll-driven animations
// transitions/→ Page transitions & Hero animations
// canvas/     → CustomPainter, particles, path drawing
// lists/      → AnimatedList, AnimatedSwitcher, animated UI components
// ─────────────────────────────────────────────────────────────────────────────

export 'canvas/screens.dart';
export 'explicit/screens.dart';
export 'gestures/screens.dart';
export 'implicit/screens.dart';
export 'lists/screens.dart';
export 'physics/screens.dart';
export 'staggered/screens.dart';
export 'three_d/screens.dart';
export 'transitions/screens.dart';
