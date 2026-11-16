import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/shadows/header_animated_shadow.dart';

class TMShadowScrollWrapper extends StatefulWidget {
  const TMShadowScrollWrapper({
    required this.child,
    required this.scrollController,
    super.key,
  });

  final Widget child;
  final ScrollController scrollController;

  @override
  State<TMShadowScrollWrapper> createState() => _TMShadowScrollWrapperState();
}

class _TMShadowScrollWrapperState extends State<TMShadowScrollWrapper> {
  bool _showShadow = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final show =
        widget.scrollController.hasClients &&
        widget.scrollController.offset > 8;

    if (show != _showShadow) {
      setState(() {
        _showShadow = show;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: IgnorePointer(
            child: TMHeaderAnimatedShadow(showShadow: _showShadow),
          ),
        ),
      ],
    );
  }
}
