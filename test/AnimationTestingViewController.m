//
//  AnimationTestingViewController.m
//  test
//
//  Created by Mickey Barboi on 9/9/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "AnimationTestingViewController.h"
#import "AnimationOneViewController.h"
#import "AnimationTwoViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface AnimationTestingViewController () {
    AnimationOneViewController *one;
    AnimationTwoViewController *two;
}

@end

@implementation AnimationTestingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"wtf?");
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];
    one = [mainStoryboard instantiateViewControllerWithIdentifier: @"one"];
    two = [mainStoryboard instantiateViewControllerWithIdentifier: @"two"];
    
    [self addChildViewController:one];
    [self addChildViewController:two];
    [one didMoveToParentViewController:self];
    [two didMoveToParentViewController:self];
    
    [viewMain addSubview:one.view];
    
        [self animateTwoIn];
}


#pragma mark Animations
- (void) animateTwoIn {
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setDuration:.5];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [two.view.layer addAnimation:animation forKey:nil];
}

#pragma mark Animations
- (void) animateOneOut {
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionReveal];
    [animation setDuration:.5];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [one.view.layer addAnimation:animation forKey:nil];
}


#pragma mark IBActions
- (IBAction)one:(id)sender {
    [two.view removeFromSuperview];
    [viewMain addSubview:one.view];
}

- (IBAction)two:(id)sender {
    [self animateOneOut];
    [self animateTwoIn];
    
    [one.view removeFromSuperview];
    [viewMain addSubview:two.view];
}
@end
