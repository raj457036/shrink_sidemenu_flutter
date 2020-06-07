# Liquid Shrink Side Menu

A Side Menu plugin for flutter and compatible with [liquid ui](https://pub.dev/packages/liquid_ui)

## Side Menu Types

There are 8 configuration of Liquid shrink side menu

#### 1. SlideNRotate

<img alt="SlideNRotate" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/slide_n_rotate.jpg" height="550">

#### 2. SlideNRotate Inverse

<img alt="SlideNRotate Inverse" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/slide_n_rotate_inv.jpg" height="550">

#### 3. ShrinkNRotate

<img alt="ShrikNRotate" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/shrink_n_rotate.jpg" height="550">

#### 4. ShrinkNRotate Inverse

<img alt="ShrinkNRotate Inverse" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/shrink_n_rotate_inv.jpg" height="550">

#### 5. Slide

<img alt="Slide" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/slide.jpg" height="550">

#### 6. Slide Inverse

<img alt="Slide Inverse" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/slide_inv.jpg" height="550">

#### 7. ShrinkNSlide

<img alt="ShrinkNSlide" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/shrink_n_slide.jpg" height="550">

#### 8. ShrinkNSlide Inverse

<img alt="ShrinkNSlide" src="https://github.com/raj457036/shrink_sidemenu_flutter/raw/master/assets/shrink_n_slide_inv.jpg" height="550">

## Getting Started

- Step 1: Add **shrink_sidemenu** to **pubspec.yaml**

```yaml
dependencies:
  flutter:
    sdk: flutter
  liquid_ui: // for extra features

  shrink_sidemenu: // Liquid Shrink Sidemenu is not dependent on liquid
```

- Step 2: Wrap **Scaffold** with **SideMenu**

```dart

final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

SideMenu(
    key: _sideMenuKey,
    menu: buildMenu(),
    type: SideMenuType.slideNRotate, // check above images
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeDrawer(); // close side menu
                else
                  _state.openDrawer();// open side menu
              },
            ),
        ...
    ),
);
```

# About liquid ui for flutter

Liquid is an open source UI toolkit for developing cross platform apps in Flutter. Quickly create apps for Android, IOS, Web or Desktop with our powerful grid system, text processor, forms, extensive prebuilt components and dozens of utilities.
**Visit: [Liquid For Flutter](https://pub.dev/packages/liquid_ui)**

# Author

[Raj Singh](https://www.linkedin.com/in/raj457036/)
