//
//  SampleViewController.m
//  CSGestureRecognizerSample
//
//  Created by tarunon on 2012/10/15.
//  Copyright (c) 2012年 tarunon. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[CSGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTest:)]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gestureTest:(CSGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"%@", recognizer.command);
    }
}

@end
