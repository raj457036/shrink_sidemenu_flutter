part of 'base.dart';

class SlideRotateSideMenuState extends SideMenuState {
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
            bottom: 0.0,
            width: min(size.width * 0.70, widget.maxMenuWidth),
            right: widget._inverse == 1 ? null : 0,
            child: widget.menu,
          ),
          _getCloseButton(statusBarHeight),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: widget.curve,
            transform: _getMatrix4(size),
            decoration: BoxDecoration(
                borderRadius: _getBorderRadius(),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 18.0),
                      color: Colors.black12,
                      blurRadius: 32.0)
                ]),
            child: _getChild(),
          ),
        ],
      ),
    );
  }

  Widget _getChild() => Stack(
        children: [
          SafeArea(
            top: _opened,
            bottom: _opened,
            right: _opened,
            left: _opened,
            child: ClipRRect(
              borderRadius: _getBorderRadius(),
              clipBehavior: Clip.antiAlias,
              child: widget.child,
            ),
          ),
          if (_opened)
            GestureDetector(
              onTap: closeSideMenu,
              child: Container(color: widget.barrierColor ?? Colors.transparent),
            ),
        ],
      );

  BorderRadius _getBorderRadius() => _opened
      ? (widget.radius ?? BorderRadius.circular(34.0))
      : BorderRadius.zero;

  Matrix4 _getMatrix4(Size size) {
    if (_opened) {
      return Matrix4.identity()
        ..rotateZ(widget.degToRad(-5.0 * widget._inverse))
        // ..scale(0.8, 0.8)
        ..translate(min(size.width, widget.maxMenuWidth) * widget._inverse,
            (size.height * 0.15))
        ..invertRotation();
    }
    return Matrix4.identity();
  }
}
