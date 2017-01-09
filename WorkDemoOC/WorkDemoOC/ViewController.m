//
//  ViewController.m
//  WorkDemoOC
//
//  Created by hb on 2017/1/9.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self testProgressView];
}


#pragma mark - test Functions

/**
 测试进度条
 */
- (void)testProgressView
{
    
    UIProgressView *_progressView;
    
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width, 2)];
    _progressView.backgroundColor = [UIColor purpleColor];
    [_progressView setProgressTintColor:[UIColor redColor]];
    [_progressView setTrackTintColor:[UIColor blackColor]];
    
    [self.view addSubview:_progressView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_progressView setProgress:0.3 animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_progressView setProgress:0.6 animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_progressView setProgress:1.0 animated:YES];
            });
        });
    });
    
}


@end
