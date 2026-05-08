import 'package:flutter/material.dart';

import 'package:flutter_animations/core/extensions/context_extensions.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _textController = TextEditingController();

  final List<_TodoItem> _items = [
    _TodoItem(id: 1, label: 'Learn AnimationController'),
    _TodoItem(id: 2, label: 'Understand Tween<Offset>'),
    _TodoItem(id: 3, label: 'Complete Day 8 stagger'),
  ];

  int _nextId = 4;

  void _addItem() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final newItem = _TodoItem(id: _nextId++, label: text);
    _items.add(newItem);
    _textController.clear();
    _listKey.currentState?.insertItem(_items.length - 1);
  }

  void _removeItem(int index) {
    final removed = _items[index];
    _items.removeAt(index);

    _listKey.currentState?.removeItem(index, (context, animation) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: SizeTransition(
          sizeFactor: curvedAnimation,
          child: _TodoTile(item: removed, onDelete: () {}),
        ),
      );
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated List')),
      body: Column(
        children: [
          _InputRow(controller: _textController, onAdd: _addItem),
          const SizedBox(height: 8),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index, animation) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                );
                final slideAnimation = Tween<Offset>(
                  begin: const Offset(0.4, 0),
                  end: Offset.zero,
                ).animate(curvedAnimation);

                return FadeTransition(
                  opacity: curvedAnimation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: _TodoTile(
                      item: _items[index],
                      onDelete: () => _removeItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _InputRow extends StatelessWidget {
  const _InputRow({required this.controller, required this.onAdd});

  final TextEditingController controller;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (_) => onAdd(),
              style: TextStyle(color: context.onSurfaceColor, fontSize: 15),
              decoration: InputDecoration(
                hintText: 'Add a new task…',
                hintStyle: TextStyle(
                  color: context.onSurfaceColor.withAlpha(90),
                  fontSize: 15,
                ),
                filled: true,
                fillColor: colors.cardBackground,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.divider),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.divider),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colors.tagText, width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 50,
            width: 50,
            child: FilledButton(
              onPressed: onAdd,
              style: FilledButton.styleFrom(
                backgroundColor: colors.tagText,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(Icons.add_rounded, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodoTile extends StatelessWidget {
  const _TodoTile({required this.item, required this.onDelete});

  final _TodoItem item;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colors.divider),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colors.tagBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${item.id}',
                style: TextStyle(
                  color: colors.tagText,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          title: Text(
            item.label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: context.onSurfaceColor,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: colors.accent,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Model ─────────────────────────────────────────────────────────────────────

class _TodoItem {
  const _TodoItem({required this.id, required this.label});
  final int id;
  final String label;
}
