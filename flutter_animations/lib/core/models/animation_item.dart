import 'package:flutter/material.dart';

class AnimationItem {
  const AnimationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.tags,
    required this.builder,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<String> tags;
  final WidgetBuilder builder;
}
