import 'package:flutter/material.dart';
import 'dart:math' show pi, min;

part 'shrink_slide_rotate_menu.dart';
part 'shrik_slide_menu.dart';
part 'slide_menu.dart';
part 'slide_rotate_menu.dart';

/// Shrink Side Menu Types
enum SideMenuType {
  /// child will shrink slide and rotate when sidemenu opens
  shrikNRotate,

  /// child will shrink and slide when sidemenu opens
  shrinkNSlide,

  /// child will slide and rotate when sidemenu opens
  slideNRotate,

  /// child will slide when sidemenu opens
  slide,
}

/// Liquid Shrink Side Menu is compatible with [Liquid ui](https://pub.dev/packages/liquid_ui)
///
/// Create a SideMenu / Drawer
///
class SideMenu extends StatefulWidget {
  final int _inverse;

  /// Widget that should be enclosed in sidemenu
  ///
  /// generally a [Scaffold] and should not be `null`
  final Widget child;

  /// Background color of the side menu
  ///
  /// default: Color(0xFF112473)
  final Color? background;

  /// Radius for the child when side menu opens
  final BorderRadius? radius;

  /// Close Icon
  final Icon? closeIcon;

  /// Menu that should be in side menu
  ///
  /// generally a [SingleChildScrollView] with a [Column]
  final Widget menu;

  /// Maximum constrints for menu width
  ///
  /// default: `275.0`
  final double maxMenuWidth;

  /// Type of Side menu
  ///
  /// 1. shrikNRotate
  /// 2. shrinkNSlide
  /// 3. slideNRotate
  /// 4. slide
  final SideMenuType type;

  final void Function(bool isOpened)? onChange;

  /// Liquid Shrink Side Menu is compatible with [Liquid ui](https://pub.dev/packages/liquid_ui)
  ///
  /// Create a SideMenu / Drawer
  ///
  ///
  ///```dart
  ///
  ///final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  ///
  ///SideMenu(
  ///    key: _sideMenuKey, // to toggle this sidemenu
  ///    menu: buildMenu(),
  ///    type: SideMenuType.slideNRotate, // check above images
  ///    child: Scaffold(
  ///        appBar: AppBar(
  ///            leading: IconButton(
  ///              icon: Icon(Icons.menu),
  ///              onPressed: () {
  ///                final _state = _sideMenuKey.currentState;
  ///                if (_state.isOpened)
  ///                  _state.closeDrawer(); // close side menu
  ///                else
  ///                  _state.openDrawer();// open side menu
  ///              },
  ///            ),
  ///        ...
  ///    ),
  ///);
  ///```
  ///
  ///Set `inverse` equals `true` to create end sidemenu
  ///
  const SideMenu({
    Key? key,
    required this.child,
    this.background,
    this.radius,
    this.closeIcon = const Icon(
      Icons.close,
      color: const Color(0xFFFFFFFF),
    ),
    required this.menu,
    this.type = SideMenuType.shrikNRotate,
    this.maxMenuWidth = 275.0,
    bool inverse = false,
    this.onChange,
  })  : assert(maxMenuWidth > 0),
        _inverse = inverse ? -1 : 1,
        super(key: key);

  static SideMenuState? of(BuildContext? context) {
    assert(context != null);
    return context?.findAncestorStateOfType<SideMenuState>();
  }

  double degToRad(double deg) => (pi / 180) * deg;

  bool get inverse => _inverse == -1;

  @override
  SideMenuState createState() {
    if (type == SideMenuType.shrikNRotate)
      return ShrinkSlideRotateSideMenuState();
    if (type == SideMenuType.shrinkNSlide) return ShrinkSlideSideMenuState();
    if (type == SideMenuType.slideNRotate) return SlideRotateSideMenuState();
    if (type == SideMenuType.slide) return SlideSideMenuState();
    return SlideSideMenuState();
  }
}

abstract class SideMenuState extends State<SideMenu> {
  late bool _opened;

  /// open SideMenu
  void openSideMenu() {
    setState(() => _opened = true);

    if (widget.onChange != null) {
      widget.onChange!(true);
    }
  }

  /// close SideMenu
  void closeSideMenu() {
    setState(() => _opened = false);

    if (widget.onChange != null) {
      widget.onChange!(false);
    }
  }

  /// get current status of sidemenu
  bool get isOpened => _opened;

  @override
  void initState() {
    super.initState();
    _opened = false;
  }

  Widget _getCloseButton(double statusBarHeight) {
    return widget.closeIcon != null
        ? Positioned(
            top: statusBarHeight,
            left: widget.inverse ? null : 0,
            right: widget.inverse ? 0 : null,
            child: IconButton(
              icon: widget.closeIcon!,
              onPressed: closeSideMenu,
            ),
          )
        : Container();
  }
}
