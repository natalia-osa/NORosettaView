//
//  ExampleViewController.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "ExampleViewController.h"
#import "ExampleView.h"

@interface ExampleViewController ()

@property(nonatomic, weak, readonly) ExampleView *aView;

@end

@implementation ExampleViewController

#pragma mark - Memory Management

- (instancetype)init {
    if (self = [super init]) {
        self.title = NSLocalizedString(@"RosettaView", nil);
    }
    
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    ExampleView *view = [[ExampleView alloc] initWithFrame:rect];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    
    // local for easier access
    _aView = view;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *transparentGray = [UIColor colorWithWhite:0.f alpha:0.2f];
    UIColor *transparentBlack = [UIColor colorWithWhite:0.f alpha:0.5f];
    [self configureOuterCircleWithColor:transparentGray selectedColor:transparentBlack];
    [self configureMiddleCircleWithColor:transparentGray];
    [self configureCenterCircleWithColor:transparentGray];
    [self configureFullCircleWithColor:transparentBlack selectedColor:[UIColor redColor]];
    
    // select one view
    [self selectIndex:1 ofView:self.aView.outerCircle];
    // configure actions
    [self.aView.animateButton addTarget:self action:@selector(animateAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UI configuration

- (void)configureOuterCircleWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor {
    NORVLeaf *leaf1 = [NORVLeaf rosettaLeafWithColor:color
                                      selectedColor:selectedColor
                                     circleTextView:[NORVCircleTextView rosettaCircleText:NSLocalizedString(@"Quite Long Button", nil)
                                                                       withTextAttributes:nil]];
    NORVLeaf *leaf2 = [NORVLeaf rosettaLeafWithColor:color
                                       selectedColor:selectedColor
                                      circleTextView:[NORVCircleTextView rosettaCircleText:NSLocalizedString(@"Button 2", nil)
                                                                        withTextAttributes:nil]];
    NORVLeaf *leaf3 = [NORVLeaf rosettaLeafWithColor:color
                                       selectedColor:selectedColor
                                      circleTextView:[NORVCircleTextView rosettaCircleText:NSLocalizedString(@"Button 3", nil)
                                                                        withTextAttributes:nil]];
    [self.aView.outerCircle setLeaves:@[leaf1, leaf2, leaf3]];
    [self.aView.outerCircle setThickness:70.f];
    [self.aView.outerCircle setMarginAngle:4.f];
    
    __weak typeof(self) weakSelf = self;
    [self.aView.outerCircle setActionBlock:^(NORVView *view, NSUInteger selectedIndex) {
        [view setSelectedIndex:selectedIndex];
        [weakSelf updateView:view withSelectedIndex:selectedIndex];
    }];
}

- (void)configureMiddleCircleWithColor:(UIColor *)color {
    [self.aView.middleCircle setLeaves:@[[NORVLeaf rosettaLeafWithColor:color selectedColor:[UIColor colorWithRed:0.f green:0.f blue:1.f alpha:0.5f] circleTextView:nil],
                                         [NORVLeaf rosettaLeafWithColor:color selectedColor:[UIColor colorWithRed:0.f green:1.f blue:0.f alpha:0.5f] circleTextView:nil],
                                         [NORVLeaf rosettaLeafWithColor:color selectedColor:[UIColor colorWithRed:1.f green:0.f blue:0.f alpha:0.5f] circleTextView:nil]]];
    [self.aView.middleCircle setThickness:15.f];
    [self.aView.middleCircle setMarginAngle:4.f];
}

- (void)configureCenterCircleWithColor:(UIColor *)color {
    [self.aView.centerCircle setLeaves:@[[NORVLeaf rosettaLeafWithColor:color selectedColor:color circleTextView:nil]]];
    [self.aView.centerCircle setThickness:10.f];
}

- (void)configureFullCircleWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor {
    NORVLeaf *leaf = [NORVLeaf rosettaLeafWithColor:color selectedColor:selectedColor circleTextView:nil];
    [self.aView.fullCircle setLeaves:@[leaf,
                                       leaf,
                                       leaf,
                                       leaf,
                                       leaf,
                                       leaf]];
    [self.aView.fullCircle setStartAngle:182.f];
    [self.aView.fullCircle setMarginAngle:5.f];
    [self.aView.fullCircle setTotalAngle:356.f];
    
    __weak typeof(self) weakSelf = self;
    [self.aView.fullCircle setActionBlock:^(NORVView *view, NSUInteger selectedIndex) {
        [view setSelectedIndex:selectedIndex];
        [weakSelf updateView:view withSelectedIndex:selectedIndex];
    }];
}

#pragma mark - Actions

- (void)selectIndex:(NSUInteger)index ofView:(NORVView *)view {
    [view setSelectedIndex:index];
    [self updateView:view withSelectedIndex:index];
}

- (void)updateView:(NORVView *)view withSelectedIndex:(NSUInteger)selectedIndex {
    UIFont *textFont = [UIFont systemFontOfSize:18.f];
    NSDictionary *textAttributes = @{NSFontAttributeName:textFont, NSForegroundColorAttributeName:[UIColor colorWithWhite:0.75f alpha:1.f]};
    NSDictionary *selectedTextAttributes = @{NSFontAttributeName:textFont, NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    for (NSUInteger i = 0; i < view.leaves.count; i++) {
        NORVLeaf *leaf = view.leaves[i];
        [leaf.circleTextView setTextAttributes:(i == selectedIndex) ? selectedTextAttributes : textAttributes];
    }
    
    [self.aView.middleCircle setSelectedIndex:selectedIndex];
}

- (void)animateAction:(id)sender {
    [self.aView setUserInteractionEnabled:NO];
    [self selectIndex:0 ofView:self.aView.outerCircle];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf selectIndex:1 ofView:weakSelf.aView.outerCircle];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf selectIndex:2 ofView:weakSelf.aView.outerCircle];
            [weakSelf.aView setUserInteractionEnabled:YES];
        });
    });
}

@end
