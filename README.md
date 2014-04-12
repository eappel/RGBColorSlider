# RGBColorSlider

RGBColorSlider provides a dead simple way to add RGB sliders that dynamically respond to each other and change their appearances to give users an intuitive way to pick colors.

![demo](README_assets/RGBColorSliderDemo.gif)


## Requirements
RGBColorSlider uses ARC and is targeted for iOS 7.0

## Installation

RGBColorSlider is available through [CocoaPods](http://cocoapods.org). To install it  

1. Add `pod 'RGBColorSlider'` to your `Podfile`
2. In your terminal run `$ pod install` and open your workspace `$ open yourApp.xcworkspace`

To manually install, copy the `Classes` folder into your project.

## Usage

To use RGBColorSlider in your project, you need to include the following:

    #import "RGBColorSlider.h"
    #import "RGBColorSliderDelegate.h"

Additionally, your view controller must adopt the `RGBColorSliderDataOutput` protocol, which has one required method.

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

To create a new RGBColorSlider, first you need to initialize a `RGBColorSliderDelegate` object  
```objective-c
RGBColorSliderDelegate *delegate = [[RGBColorSliderDelegate alloc] init];
```

Then use the custom init method to create a slider  
```objective-c
- (id)initWithFrame:(CGRect)frame sliderColor:(RGBColorType)color trackHeight:(float)height delegate:(id<RGBColorSliderDelegate>)delegate
```

Creating red, green, and blue sliders would look something like:  
```objective-c
RGBColorSliderDelegate *delegate = [[RGBColorSliderDelegate alloc] init];
delegate.delegate = self;  

RGBColorSlider *redSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 140, 280, 44) sliderColor:RGBColorTypeRed trackHeight:6 delegate:delegate];
RGBColorSlider *greenSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 188, 280, 44) sliderColor:RGBColorTypeGreen trackHeight:6 delegate:delegate];
RGBColorSlider *blueSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 232, 280, 44) sliderColor:RGBColorTypeBlue trackHeight:6 delegate:delegate];  
    
[self.view addSubview:redSlider];
[self.view addSubview:greenSlider];
[self.view addSubview:blueSlider];
```
Note that you need to set the RGBColorSliderDelegate's delegate to `self` to enable reporting of the updated color when a slider value is changed.  

In the example project, `-updateColor:` changes the background color of a UIView to display the current color based on each slider value.

##FAQ

##### Do I need to use all three sliders?  
No.  The code will work if you use any combination of sliders.

##### What about an alpha slider?  
To add a an alpha slider, create an RGBColorSlider just like you would for red, green, or blue, but pass `RGBColorTypeAlpha` to the color parameter.

##### The `-updateColor` method works great but how can I get the current color without waiting for the user to interact with a slider?  
To fetch the current color at a specific point in time, use the following methods declared in `RGBColorSliderDelegate.h` to get current color values:
```objective-c
- (UIColor *)getCurrentColor;
- (float)getRedColorComponent;
- (float)getGreenColorComponent;
- (float)getBlueColorComponent;
- (float)getAlphaComponent;
```

## Design

### [RGBColorSlider.h](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSlider.h)  [/ .m](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSlider.m)

RGBColorSlider is a subclass of [UISlider](https://developer.apple.com/library/ios/documentation/uikit/reference/UISlider_Class/Reference/Reference.html).  

###### Properties
```objective-c
@property (nonatomic, readonly) id<RGBColorSliderDelegate> delegate;
@property (nonatomic, assign, readonly) RGBColorType sliderColor;
@property (nonatomic, assign, readonly) float trackHeight;
```
###### Methods
```objective-c
- (id)initWithFrame:(CGRect)frame sliderColor:(RGBColorType)color trackHeight:(float)height delegate:(id<RGBColorSliderDelegate>)delegate;
- (void)connectToDelegate:(id<RGBColorSliderDelegate>)delegate
- (void)valueDidChange:(RGBColorSlider *)sender
```
The [header file](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSlider.h) also defines the RGBColorSliderDelegate protocol that will be adopted by the [delegate object](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSliderDelegate.h).
```objective-c
@protocol RGBColorSliderDelegate <NSObject>
@required
- (void)slider:(RGBColorSlider *)sender valueDidChangeTo:(float)value forSliderColor:(RGBColorType)color;
@required
- (void)connectSlider:(RGBColorSlider *)sender toColor:(RGBColorType)color;
@end
```
Using a RGBColorSlider requires the use of the custom init method (`-initWithFrame:sliderColor:trackHeight:delegate`) for a couple reasons.

### [RGBColorSliderDelegate.h](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSliderDelegate.h)   [/ .m](https://github.com/eappel/RGBColorSlider/blob/master/Classes/RGBColorSliderDelegate.m)


### Diagram

![diagram](README_assets/RGBColorSliderDiagram.png)

## License

RGBColorSlider is available under the MIT license. See the [LICENSE](https://github.com/eappel/RGBColorSlider/blob/master/LICENSE) file for more info.

