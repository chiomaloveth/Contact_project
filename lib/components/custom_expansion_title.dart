import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.leading,
    required this.title,
    required this.children,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: widget.leading,
          title: widget.title,
          trailing: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 200),
            tween: Tween(begin: 0.0, end: _isExpanded ? 0.5 : 0.0),
            builder: (context, value, child) {
              return Transform.rotate(
                angle: value * 3.14, // half turn (right to down)
                child: const Icon(Icons.keyboard_arrow_right),
              );
            },
          ),
          onTap: () => setState(() => _isExpanded = !_isExpanded),
        ),
        if (_isExpanded)
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.6),
            child: Column(children: widget.children),
          ),
      ],
    );
  }
}
