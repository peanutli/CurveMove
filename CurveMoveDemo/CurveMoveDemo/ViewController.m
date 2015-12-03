//
//  ViewController.m
//  CurveMoveDemo
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 dachuan.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString * const kCurveMoveKey = @"cureMove";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * point = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 5, 5)];
    [self.view addSubview:point];
    point.backgroundColor = [UIColor orangeColor];
    
    UIView * circle = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:circle];
    circle.backgroundColor = [UIColor greenColor];
    circle.alpha = 0.5;
    
    //用CGMutablePathRef来创建路线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, circle.frame);
    
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animate.delegate =self;
    animate.duration = 3;
    animate.fillMode = kCAFillModeForwards;
    animate.repeatCount = 50;
    animate.path = path;
    animate.removedOnCompletion = YES;
    CGPathRelease(path);
    [point.layer addAnimation:animate forKey:kCurveMoveKey];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
