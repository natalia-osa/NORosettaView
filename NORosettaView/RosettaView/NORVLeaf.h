//
//  NORVLeaf.h
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NORVCircleTextView.h"

@interface NORVLeaf : NSObject

/**
 *  Convenience initializer for NORosettaLeaf.
 *
 *  @return NORosettaLeaf with given parameters.
 */
+ (NORVLeaf *)rosettaLeafWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor circleTextView:(NORVCircleTextView *)circleTextView;

/**
 *  Defines the color, which should be drawn in given leaf.
 *  Default [UIColor grayColor].
 */
@property(nonatomic) UIColor *color;

/**
 *  Defines the color, which should be drawn in given leaf when it is selected.
 *  Default [UIColor blackColor].
 */
@property(nonatomic) UIColor *selectedColor;

/**
 *  Defines circle text drawn on given arc. To skip text, provide nil.
 *  Default with "1" text.
 */
@property(nonatomic) NORVCircleTextView *circleTextView;

@end
