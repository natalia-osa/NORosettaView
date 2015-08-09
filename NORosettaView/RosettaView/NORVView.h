//
//  NORVView.h
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NORVCircleTextView.h"
#import "NORVLeaf.h"

@interface NORVView : UIView

/**
 *  Gets called when user tapped view at selected index.
 */
@property(nonatomic, copy) void (^actionBlock)(NORVView *view, NSUInteger selectedIndex);

/**
 *  Indicates which index is currently selected (changes outlook to selected).
 *  Default -1 (nothing selected).
 */
@property(nonatomic) NSUInteger selectedIndex;

/**
 *  Defines numer of leaves (of type NORVLeaf). You can customize each one separately.
 */
@property(nonatomic) NSArray *leaves;

/**
 *  Use to change place, where 1st item is being drawn. Acceptable values (0; 360). Eg 270 is top, 0 right, 45 is right bottom 'corner' etc.
 *  Default 180.f (left middle).
 */
@property(nonatomic) CGFloat startAngle;

/**
 *  Defines the area where to spread the views in degrees. Eg 180 will fill half of the circle. 
 *  Default 180.f.
 */
@property(nonatomic) CGFloat totalAngle;

/**
 *  Defines clear space between leafs in degrees. 
 *  Default 2.f.
 */
@property(nonatomic) CGFloat marginAngle;

/**
 *  Defines the thickness of view.
 *  Default 10.f.
 */
@property(nonatomic) CGFloat thickness;

@end
