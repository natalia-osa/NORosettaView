//
//  Example1View.m
//  NORosettaView
//
//  Created by Natalia Paula Osiecka on 09/08/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import "Example1View.h"

@implementation Example1View

- (nonnull instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _centerCircle = [[NORVView alloc] initWithFrame:frame];
        [self addSubview:_centerCircle];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_centerCircle setFrame:self.bounds];
}

@end
