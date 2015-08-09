//
//  NORVView.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NORVView.h"
#import <NOCategories/NOCMacros.h>
#import <NOCategories/NOCCGFloatMath.h>

@implementation NORVView

#pragma mark - Memory management

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    [self setOpaque:NO];
    [self setAutoresizesSubviews:YES];
    [self setContentMode:UIViewContentModeRedraw];
    [self setBackgroundColor:[UIColor clearColor]];
    
    // set default values
    _leaves = @[];
    _startAngle = 180.0;
    _totalAngle = 180.f;
    _marginAngle = 2.f;
    _thickness = 10.f;
    _selectedIndex = -1;
    _shadowWidth = 0;
    
    _shadowColor = [UIColor clearColor];
}

#pragma mark - Setters / Getters

- (void)setLeaves:(NSArray *)leaves {
    NSAssert(leaves.count != 0, @"You need to provide one or more leaf!");
    
    // remove old subviews
    for (NORVLeaf *rosettaLeaf in _leaves) {
        [rosettaLeaf.circleTextView removeFromSuperview];
    }
    // add new subviews
    for (NORVLeaf *rosettaLeaf in leaves) {
        [self addSubview:rosettaLeaf.circleTextView];
    }
    
    _leaves = leaves;
    [self setNeedsDisplay];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self setNeedsDisplay];
}

- (void)setStartAngle:(CGFloat)startAngle {
    _startAngle = startAngle;
    [self setNeedsDisplay];
}

- (void)setTotalAngle:(CGFloat)totalAngle {
    _totalAngle = totalAngle;
    [self setNeedsDisplay];
}

- (void)setMarginAngle:(CGFloat)marginAngle {
    _marginAngle = marginAngle;
    [self setNeedsDisplay];
}

- (void)setThickness:(CGFloat)thickness {
    _thickness = thickness;
    [self setNeedsDisplay];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    [self setNeedsDisplay];
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NORVLeaf *rosettaLeaf in _leaves) {
        CGSize stringSize = [rosettaLeaf.circleTextView.text sizeWithAttributes:rosettaLeaf.circleTextView.textAttributes];
        CGRect leafRect = CGRectIntegral(CGRectInset(self.bounds, self.thickness / 2.f - stringSize.width / 2.f,
                                                     self.thickness / 2.f - stringSize.height / 2.f));
        [rosettaLeaf.circleTextView setFrame:leafRect];
    }
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    CGRect frame = self.bounds;
    // setup context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, frame);
    
    // draw background color
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, frame);
    
    // set width of arcs
    CGContextSetLineWidth(context, self.thickness);
    
    // draw arcs
    CGFloat startAngle = self.startAngle;
    CGFloat viewAngle = [self viewAngle];
    NSUInteger currentIndex = 0;
    for (NORVLeaf *rosettaLeaf in self.leaves) {
        UIColor *leafColor = (currentIndex == self.selectedIndex) ? rosettaLeaf.selectedColor : rosettaLeaf.color;
        [self drawColor:leafColor atCenter:[self circleCenter] withRadius:[self radius] fromAngle:noc_radians(startAngle) toEndAngle:noc_radians((startAngle + viewAngle)) inContext:context];
        [rosettaLeaf.circleTextView setBaseAngle:noc_radians((startAngle + viewAngle / 2.f))];
        
        startAngle = startAngle + self.marginAngle + viewAngle;
        currentIndex += 1;
    }
}

- (void)drawColor:(UIColor *)color atCenter:(CGPoint)center withRadius:(CGFloat)radius fromAngle:(CGFloat)startAngle toEndAngle:(CGFloat)endAngle inContext:(CGContextRef)context {
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, NO);
    CGContextSetShadowWithColor(context, CGSizeMake(0.f, 0.f), self.shadowWidth, self.shadowColor.CGColor);
    CGContextStrokePath(context);
}

#pragma mark - Logging

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@: %li, %@: %.2f, %@: %.2f, %@: %.2f, %@: %.2f, %@: %@>",
            NSStringFromClass([self class]), self,
            NSStringFromSelector(@selector(selectedIndex)), (long)self.selectedIndex,
            NSStringFromSelector(@selector(startAngle)), self.startAngle,
            NSStringFromSelector(@selector(totalAngle)), self.totalAngle,
            NSStringFromSelector(@selector(marginAngle)), self.marginAngle,
            NSStringFromSelector(@selector(thickness)), self.thickness,
            NSStringFromSelector(@selector(leaves)), self.leaves];
}

#pragma mark - Helpers

- (CGFloat)viewAngle {
    return (self.totalAngle - (self.marginAngle * (self.leaves.count - 1))) / self.leaves.count;
}

- (CGFloat)radius {
    return CGRectGetWidth(self.bounds) / 2.f - self.thickness / 2.f;
}

- (CGPoint)circleCenter {
    return CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

- (CGFloat)distanceBetweenPoint1:(CGPoint)point1 point2:(CGPoint)point2 {
    CGFloat dx = point2.x - point1.x;
    CGFloat dy = point2.y - point1.y;
    
    return sqrt(dx * dx + dy * dy);
}

- (CGFloat)pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint)endingPoint {
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y);
    CGFloat bearingRadians = atan2f(originPoint.y, originPoint.x);
    CGFloat bearingDegrees = noc_degrees(bearingRadians);
    bearingDegrees = bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees);
    
    return bearingDegrees;
}

- (NSUInteger)viewIndexForPoint:(CGPoint)touchPoint {
    CGPoint circleCenter = [self circleCenter];
    CGFloat distance = [self distanceBetweenPoint1:circleCenter point2:touchPoint];
    
    CGRect frame = self.bounds;
    CGFloat maxRadius = CGRectGetWidth(frame) / 2.f;
    CGFloat minRadius = maxRadius - self.thickness;
    
    BOOL isInsideRosetta = (distance < maxRadius) && (distance > minRadius);
    if (isInsideRosetta) {
        CGFloat touchAngle = [self pointPairToBearingDegrees:circleCenter secondPoint:touchPoint];
        CGFloat viewAngle = [self viewAngle];
        
        CGFloat relativeTouchAngle = touchAngle - self.startAngle;
        relativeTouchAngle = relativeTouchAngle > 0.0 ? relativeTouchAngle : (360.0 + relativeTouchAngle);
        NSInteger touchedView = noc_floorCGFloat(relativeTouchAngle / (viewAngle + self.marginAngle));
        
        // user may have only 1 view, rest is without leaves -> don't react to touch there
        if (touchedView < self.leaves.count) {
            return touchedView;
        }
    }
    
    return NSNotFound;
}

#pragma mark - Handling touches

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    
    BOOL touchedSubview = NO;
    for (UIView *view in self.subviews) {
        if (view == result) {
            touchedSubview = YES;
            break;
        }
    }
    
    BOOL isViewTapped = ([self viewIndexForPoint:point] != NSNotFound);
    if ((result == self || touchedSubview) && isViewTapped) {
        return result;
    } else {
        return nil;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    if (self.actionBlock) {
        CGPoint touchPoint = [[touches anyObject] locationInView:self];
        NSInteger touchedViewIndex = [self viewIndexForPoint:touchPoint];
        if (touchedViewIndex != NSNotFound) {
            self.actionBlock(self, touchedViewIndex);
        }
    }
}

@end
