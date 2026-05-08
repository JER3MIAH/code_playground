import 'package:flutter/material.dart';

import '../../features/animations/screens.dart';
import '../models/animation_item.dart';

// Add new animation demos here.
// Each entry appears as a card on the home screen.
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
    id: 'staggered_entrance',
    title: 'Staggered Entrance',
    subtitle:
        'A synchronized orchestration of multiple elements using a single controller and overlapping Intervals.',
    icon: Icons.sort_rounded,
    color: const Color(0xFF7F77DD),
    tags: const ['Staggered', 'Interval', 'Opacity', 'Scale', 'Slide'],
    builder: (_) => const StaggeredEntranceScreen(),
  ),
  AnimationItem(
    id: 'animated_list',
    title: 'Animated List',
    subtitle:
        'Add and remove items with slide, fade, and size-collapse transitions using the AnimatedList API.',
    icon: Icons.format_list_bulleted_rounded,
    color: const Color(0xFF26C6DA),
    tags: const [
      'AnimatedList',
      'SizeTransition',
      'SlideTransition',
      'FadeTransition',
    ],
    builder: (_) => const AnimatedListScreen(),
  ),
];
