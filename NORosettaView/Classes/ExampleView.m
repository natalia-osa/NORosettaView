//
//  ExampleView.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "ExampleView.h"

@implementation ExampleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer.colors = @[(id)[[UIColor orangeColor] CGColor], (id)[[UIColor yellowColor] CGColor]];
        [self.layer addSublayer:self.gradientLayer];
        
        _outerCircle = [[NORVView alloc] initWithFrame:frame];
        [self addSubview:self.outerCircle];
        
        _middleCircle = [[NORVView alloc] initWithFrame:frame];
        [self addSubview:self.middleCircle];
        
        _centerCircle = [[NORVView alloc] initWithFrame:frame];
        [self addSubview:self.centerCircle];
        
        _fullCircle = [[NORVView alloc] initWithFrame:frame];
        [self addSubview:self.fullCircle];
        
        _animateButton = [[UIButton alloc] initWithFrame:frame];
        [self.animateButton.layer setBorderWidth:1.f];
        [self.animateButton.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.animateButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.animateButton setTitle:NSLocalizedString(@"Animation", nil) forState:UIControlStateNormal];
        [self addSubview:self.animateButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    CGFloat bigMargin = 10.f;
    CGFloat smallMargin = 5.f;
    
    CGFloat outerCircleRadius = CGRectGetWidth(frame) / 2.f - bigMargin;
    CGRect outerCircleRect = CGRectMake(bigMargin,
                                        CGRectGetMidY(frame) - outerCircleRadius,
                                        outerCircleRadius * 2, outerCircleRadius * 2);
    
    CGFloat middleCircleRadius = CGRectGetWidth(outerCircleRect) / 2.f - self.outerCircle.thickness - smallMargin;
    CGRect middleCircleRect = CGRectMake(CGRectGetMinX(outerCircleRect) + smallMargin + self.outerCircle.thickness,
                                         CGRectGetMidY(frame) - middleCircleRadius,
                                         middleCircleRadius * 2, middleCircleRadius * 2);
    
    CGFloat centerCircleRadius = CGRectGetWidth(middleCircleRect) / 2.f - self.middleCircle.thickness - smallMargin;
    CGRect centerCircleRect = CGRectMake(CGRectGetMinX(middleCircleRect) + smallMargin + self.middleCircle.thickness,
                                         CGRectGetMidY(frame) - centerCircleRadius,
                                         centerCircleRadius * 2, centerCircleRadius * 2);
    
    [self.outerCircle setFrame:outerCircleRect];
    [self.middleCircle setFrame:middleCircleRect];
    [self.centerCircle setFrame:centerCircleRect];
    [self.animateButton setFrame:CGRectMake(bigMargin, CGRectGetMidY(frame) + bigMargin, CGRectGetWidth(frame) - 2 * bigMargin, 35.f)];
    
    CGFloat fullCircleRadius = (CGRectGetMaxY(frame) - CGRectGetMaxY(self.animateButton.frame)) / 2.f - bigMargin;
    CGRect fullCircleRect = CGRectMake((CGRectGetWidth(frame) - fullCircleRadius * 2) / 2, CGRectGetMaxY(self.animateButton.frame) + bigMargin, fullCircleRadius * 2, fullCircleRadius * 2);
    [self.fullCircle setFrame:fullCircleRect];
    [self.fullCircle setThickness:fullCircleRadius];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    
    if ([layer isEqual:self.layer]) {
        [self.gradientLayer setFrame:self.bounds];
    }
}

@end
