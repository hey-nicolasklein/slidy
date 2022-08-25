

<p align="center">
  <img src="https://user-images.githubusercontent.com/32168266/186658747-815f75a5-d3fc-4f75-9e06-5978d1b432c3.png" alt="Slidy Logo" width="300"/>
</p>
<p align="center">A colorful customizable slider widget written with Flutter.</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/32168266/186657428-9b916ffb-5f6d-4876-8393-e497a11a0bb1.png" alt="Slidy Logo" width="100"/>
</p>

## Features

A simple vertical slider, which can be used for example to confirm a user action.

The following settings can be adjusted:
- Optional icon inside the draggable nob
- Optional background widget inside the slider
- Background widget becomes increasingly invisible when the slider moves upwards
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

## Slidy in action
<a href="https://user-images.githubusercontent.com/32168266/186659728-67544af0-8d6b-4ab1-ab95-13fab8598aea.mov"> Video demonstrating the slider</a>

