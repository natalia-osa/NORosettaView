[![Version](https://cocoapod-badges.herokuapp.com/v/NORosettaView/badge.png)](http://cocoadocs.org/docsets/NORosettaView) 
[![Platform](https://cocoapod-badges.herokuapp.com/p/NORosettaView/badge.png)](http://cocoadocs.org/docsets/NORosettaView) 
![License](https://img.shields.io/badge/license-Apache_2-green.svg?style=flat)

# NORosettaView
Circle arc based control with selected number of leaves (like a pizza).

## Examples:
<p align="center" >
<img src="https://raw.github.com/natalia-osa/NORosettaView/master/ReadmeImages/Fullscreen.png" alt="NORosettaView" title="NORosettaView" height="480">
<img src="https://raw.github.com/natalia-osa/NORosettaView/master/ReadmeImages/Fullscreen2.png" alt="NORosettaView" title="NORosettaView" height="480">
</p>

## Customisable outlook:
- set the angle where to start drawing (eg draw from top),
- set the total angle of the drawing (eg 180 degrees, so half of the circle),
- set number of arcs to display,
- change size of the margin between arcs,
- customise the background color of selected and not selected arc,
- change the thickness of the drawing (draw full arc to the middle of the circle or just the border),
- add text on each arc (round label),
- customise details like shadows,
- respond to tap on each leaf (take advantage of blocks).

<p align="center" >
<img src="https://raw.github.com/natalia-osa/NORosettaView/master/ReadmeImages/img1.png" alt="NORosettaView img1" title="NORosettaView" height="200">
<img src="https://raw.github.com/natalia-osa/NORosettaView/master/ReadmeImages/img2.png" alt="NORosettaView img1" title="NORosettaView" height="200">
<img src="https://raw.github.com/natalia-osa/NORosettaView/master/ReadmeImages/img3.png" alt="NORosettaView img1" title="NORosettaView" height="200">
</p>

## Implementation:
Please refer to the demo for more in depth examples or check out source code.

### NORVView
- actionBlock - Allows to react to user interaction (taps).
```objective-c
[rosettaView setActionBlock:^(NORVView *view, NSUInteger selectedIndex) {
    [view setSelectedIndex:selectedIndex];
    [weakSelf updateView:view withSelectedIndex:selectedIndex];
}];
```
- selectedIndex - Determines the index of selected arc in the circle.
```objective-c
[rosettaView setSelectedIndex:selectedIndex];
```
- leaves - Determines number of arcs, colors, text etc. Refer to [NORVLeaf documentation](https://github.com/natalia-osa/NORosettaView#norvleaf) for more details.
```objective-c
[rosettaView setLeaves:@[leaf1, leaf2, leaf3]];
```
- startAngle - Determines the position where to start drawing the arcs. Default 180 degrees, which is left middle.
```objective-c
 [rosettaView setStartAngle:45.f];
```
- totalAngle - Determines the angle on which all arcs should be drawn. Eg 180 will make half of the circle filled with arcs, rest will be empty.
```objective-c
 [rosettaView setTotalAngle:90.f];
```
- marginAngle - Determines the angle between arcs on the outer side of the circle.
```objective-c
 [rosettaView setMarginAngle:5.f];
```
- thickness - Determines the width which should be filled with color. 1 causes a border, radius causes full fill with the color.
```objective-c
[rosettaView setThickness:70.f];
```
- shadowWidth - Determines the width of shadow around the elements.
```objective-c
 [rosettaView setShadowWidth:5];
```
- shadowColor - Determines the color of shadow around the elements.
```objective-c
 [rosettaView setShadowColor:[UIColor blackColor]];
```
### NORVLeaf
- rosettaLeafWithColor:selectedColor:circleTextView: - Convenience initializer for leaf objects, with basic setup.
```objective-c
[NORVLeaf rosettaLeafWithColor:[UIColor grayColor]
                                         selectedColor:[UIColor blackColor]
                                        circleTextView:[NORVCircleTextView rosettaCircleText:@"Button" withTextAttributes:nil]];
```
- color - Determines the color of not selected element.
```objective-c
 [leaf setColor:[UIColor blackColor]];
```
- selectedColor - Determines the color of the selected element.
```objective-c
 [leaf setSelectedColor:[UIColor blackColor]];
```
- circleTextView - Determines the label with rounded text.
```objective-c
 [leaf.circleTextView setTextAttributes:(i == selectedIndex) ? selectedTextAttributes : textAttributes];
```
### NORVCircleTextView
Inherits from XMCircleTypeView (credits: [XMCircleType](https://github.com/MichMich/XMCircleType)). Is used to display the text on each leaf.
- rosettaCircleText:withTextAttributes: -  Convenience initializer for text with attrubutes.
```objective-c
[NORVCircleTextView rosettaCircleText:NSLocalizedString(@"Quite Long Button", nil)
                                                                       withTextAttributes:nil];
```
## Installation:
#### Installation with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries.
```ruby
pod "NORosettaView"
```
#### Submodule
In your projects git folder type:
```bash
git submodule init
git submodule add --copy link to the repo--
git submodule update
```
Copy all files from NORosettaView/RosettaView folder.
#### Just download & attach
This is strongly misadvised as you won't be able to see code updates. Clone or download the source, copy all files from NOCategories folder.

## ChangeLog
- 0.1 Added basic project, configured styling, added first cocoapod.

## Author

Natalia Osiecka, osiecka.n@gmail.com
- [Natalia Osiecka](https://github.com/natalia-osa/) ([@vivelee](https://twitter.com/vivelee))

## License

Available under the Apache 2.0 license. See the LICENSE file for more info.

## Requirements

Requires Xcode 6, targeting either iOS 6.0 or higher.
