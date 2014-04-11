# RGBColorSlider

[![Version](http://cocoapod-badges.herokuapp.com/v/RGBColorSlider/badge.png)](http://cocoadocs.org/docsets/RGBColorSlider)
[![Platform](http://cocoapod-badges.herokuapp.com/p/RGBColorSlider/badge.png)](http://cocoadocs.org/docsets/RGBColorSlider)


## Requirements
RGBColorSlider uses ARC and is targeted for iOS 7.0

## Installation

### CocoaPods

RGBColorSlider is available through [CocoaPods](http://cocoapods.org). To install it  

1. Add `pod 'RGBColorSlider'` to your `Podfile`
2. In your terminal run `$ pod install` and open your workspace `$ open yourApp.xcworkspace`

### Manual

Copy the `Classes` folder into your project.

## Usage

To use RGBColorSlider in your project, you need to include the following:

    #import "RGBColorSlider.h"
    #import "RGBColorSliderDelegate.h"

Additionally, your view controller must adopt the `RGBColorSliderDataOutput` protocol which has one required method:

```objective-c
@interface YourViewController () <RGBColorSliderDataOutlet>
```
```objective-c
- (void)updateColor:(UIColor *)color
{
	// ... Do something ...
}
```

## Example



## License

RGBColorSlider is available under the MIT license. See the LICENSE file for more info.

