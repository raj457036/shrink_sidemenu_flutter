part of 'base.dart';

class SlideSideMenuState extends SideMenuState {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    final statusBarHeight = mq.padding.top;

    return Material(
      color: widget.background ?? const Color(0xFF112473),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: statusBarHeight + (widget.closeIcon?.size ?? 25.0) * 2,
            width: min(size.width * 0.70, widget.maxMenuWidth),
            right: widget._inverse == 1 ? null : 0,
            child: widget.menu,
          ),
          _getCloseButton(statusBarHeight),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastLinearToSlowEaseIn,
            alignment: Alignment.topLeft,
            transform: _getMatrix4(size),
            child: widget.child,
          ),
        ],
      ),
    );
  }

  Matrix4 _getMatrix4(Size size) {
    if (_opened) {
      return Matrix4.identity()
        ..translate(
            min(size.width * 0.70, widget.maxMenuWidth) * widget._inverse);
    }
    return Matrix4.identity();
  }
}
