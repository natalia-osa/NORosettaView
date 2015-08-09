//
//  Example2View.h
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NORVView.h"

@interface Example2View : UIView

@property(nonatomic, readonly) NORVView *outerCircle;
@property(nonatomic, readonly) NORVView *middleCircle;
@property(nonatomic, readonly) NORVView *centerCircle;
@property(nonatomic, readonly) NORVView *fullCircle;

@property(nonatomic, readonly) UIButton *animateButton;
@property(nonatomic, readonly) CAGradientLayer *gradientLayer;

@end
