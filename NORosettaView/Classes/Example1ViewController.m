//
//  Example1ViewController.m
//  NORosettaView
//
//  Created by Natalia Paula Osiecka on 09/08/15.
//  Copyright © 2015 iOskApps. All rights reserved.
//

#import "Example1ViewController.h"
#import "Example1View.h"
#import <NOCategories/UIViewController+NOCViewInitializer.h>

@interface Example1ViewController ()

@property(nonatomic, weak, readonly) Example1View *aView;

@end

@implementation Example1ViewController

- (instancetype)init {
    if (self == [super init]) {
        self.title = NSLocalizedString(@"Simple", nil);
    }
    
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    _aView = [self noc_loadViewOfClass:[Example1View class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *leaves = @[[NORVLeaf rosettaLeafWithColor:[UIColor yellowColor]
                                         selectedColor:[UIColor blackColor]
                                        circleTextView:[NORVCircleTextView rosettaCircleText:@"" withTextAttributes:nil]],
                        [NORVLeaf rosettaLeafWithColor:[UIColor redColor]
                                         selectedColor:[UIColor blackColor]
                                        circleTextView:[NORVCircleTextView rosettaCircleText:@"" withTextAttributes:nil]],
                        [NORVLeaf rosettaLeafWithColor:[UIColor blueColor]
                                         selectedColor:[UIColor blackColor]
                                        circleTextView:[NORVCircleTextView rosettaCircleText:@"" withTextAttributes:nil]]];
    [self.aView.centerCircle setLeaves:leaves];
    [self.aView.centerCircle setStartAngle:45.f];
    [self.aView.centerCircle setTotalAngle:90.f];
    [self.aView.centerCircle setMarginAngle:0.f];
    [self.aView.centerCircle setShadowColor:[UIColor blackColor]];
    [self.aView.centerCircle setShadowWidth:5];
    [self.aView.centerCircle setActionBlock:^(NORVView *view, NSUInteger selectedIndex) {
        [view setSelectedIndex:selectedIndex];
        NSLog(@"Tapped index: %li", (long)selectedIndex);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat circleRadius = MIN(CGRectGetWidth(self.aView.centerCircle.frame), CGRectGetHeight(self.aView.centerCircle.frame)) / 2.f;
    [self.aView.centerCircle setThickness:circleRadius];
}

@end
