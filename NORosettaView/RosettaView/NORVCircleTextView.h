//
//  NORVCircleTextView.h
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XMCircleType/XMCircleTypeView.h>

#define radians(x) (x * M_PI / 180)
#define degrees(x) (x * 180 / M_PI)

@interface NORVCircleTextView : XMCircleTypeView

/**
 *  Convenience initializer for NORVCircleTextView.
 *
 *  @return NORVCircleTextView with given parameters.
 */
+ (NORVCircleTextView *)rosettaCircleText:(NSString *)text withTextAttributes:(NSDictionary *)textAttributes;

@end
