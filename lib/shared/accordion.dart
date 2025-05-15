import 'package:flutter/material.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final Widget child;
  final ScrollController? scrollController;

  const CustomAccordion({
    super.key,
    required this.title,
    required this.child,
    this.scrollController,
  });

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isExpanded = false;

  void scrollToSelf(BuildContext context) {
    if (widget.scrollController == null) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero).dy + widget.scrollController!.offset;
      widget.scrollController!.animateTo(
        offset - 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: AnimatedRotation(
        turns: _isExpanded ? 0.5 : 0,
        duration: const Duration(milliseconds: 200),
        child: const Icon(Icons.keyboard_arrow_right),
      ),
      onExpansionChanged: (expanded) {
        setState(() => _isExpanded = expanded);
        if (expanded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollToSelf(context);
          });
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ],
    );
  }
}
