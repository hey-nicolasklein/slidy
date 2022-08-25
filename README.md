<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Slidy

A colorful customizable slider widget written with Flutter

## Features

A simple vertical slider, which can be used for example to confirm a user action.

The following settings can be adjusted:
- Optional icon inside the draggable nob
- Optional background widget inside the slider
- Shimmer over the background widget
- Alternative upward pointing arrow included as background widget
- Full color customization of border, inner background or inner gradient

## Getting started

Just include Slidy with 
```dart
import 'package:slidy/slidy.dart';
```
and include it in your app. For example like:



## Usage
```dart
Slidy(
  displayArrowBackgroundElement: true,
  shimmer: true,
  nobIcon: const Icon(
    Icons.favorite,
    color: Colors.white,
  ),
  height: 200,
  width: 60,
  action: () {
    setState(() {
      counter = counter + 1;
    });
  },
),
```

## Additional information
Please submit as Issues any problems or feature suggestions.
