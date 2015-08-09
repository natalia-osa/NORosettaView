//
//  NORVCircleTextView.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NORVCircleTextView.h"
#import <NOCategories/NOCCGFloatMath.h>

@implementation NORVCircleTextView

+ (NORVCircleTextView *)rosettaCircleText:(NSString *)text withTextAttributes:(NSDictionary *)textAttributes {
    NORVCircleTextView *circleTextView = [[NORVCircleTextView alloc] initWithFrame:CGRectZero];
    [circleTextView setBackgroundColor:[UIColor clearColor]];
    [circleTextView setText:text];
    [circleTextView setTextAttributes:textAttributes];
    [circleTextView setTextAlignment:NSTextAlignmentCenter];
    [circleTextView setVerticalTextAlignment:XMCircleTypeVerticalAlignCenter];
    [circleTextView setBaseAngle:noc_radians(270.f)];
    [circleTextView setCharacterSpacing:0.85f];
    [circleTextView setUserInteractionEnabled:YES];
    
    return circleTextView;
}

#pragma mark - Setters / Getters

- (void)setTextAttributes:(NSDictionary *)textAttributes {
    [super setTextAttributes:textAttributes];
    
    [self.superview setNeedsLayout];
}

@end
