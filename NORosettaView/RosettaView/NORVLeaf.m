//
//  NORVLeaf.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "NORVLeaf.h"

@implementation NORVLeaf

+ (NORVLeaf *)rosettaLeafWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor circleTextView:(NORVCircleTextView *)circleTextView {
    NORVLeaf *leaf = [[NORVLeaf alloc] init];
    leaf.color = color;
    leaf.selectedColor = selectedColor;
    leaf.circleTextView = circleTextView;
    
    return leaf;
}

#pragma mark - Memory management

- (instancetype)init {
    if (self = [super init]) {
        _color = [UIColor grayColor];
        _selectedColor = [UIColor blackColor];
        _circleTextView = [NORVCircleTextView rosettaCircleText:@"1" withTextAttributes:nil];
    }
    
    return self;
}

#pragma mark - Logging

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@: %@, %@: %@, %@: %@>",
            NSStringFromClass([self class]), self,
            NSStringFromSelector(@selector(color)), self.color,
            NSStringFromSelector(@selector(selectedColor)), self.selectedColor,
            NSStringFromSelector(@selector(circleTextView)), self.circleTextView];
}

@end
