//
//  ViewController.m
//  JJObjectPool
//
//  Created by lucy on 2017/12/4.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJFallingGiftView.h"

@interface ViewController () <JJFallingGiftViewDelegate>

@property (nonatomic, strong) NSMutableArray <JJFallingGiftView *> *enqueueArrM;
@property (nonatomic, strong) NSMutableArray <JJFallingGiftView *> *dequeueArrM;
@property (nonatomic, strong) JJFallingGiftView *giftView;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.enqueueArrM = [NSMutableArray array];
    self.dequeueArrM = [NSMutableArray array];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击模拟直播间收到礼物，然后进行实例化礼物视图
    self.giftView = [self dequeueFallingView];
    NSLog(@"self.giftView = %@", self.giftView);
    self.giftView.delegate = self;
    [self.giftView doAnimtion];
}

#pragma mark - Object Private Function

- (JJFallingGiftView *)dequeueFallingView
{
    if (self.dequeueArrM.count > 0) {
        [self.enqueueArrM addObject:self.dequeueArrM.lastObject];
        [self.dequeueArrM removeLastObject];
        return self.enqueueArrM.lastObject;
    }
    JJFallingGiftView *fallingGiftView = [[JJFallingGiftView alloc] init];
    [self.enqueueArrM addObject:fallingGiftView];
    [self.view addSubview:fallingGiftView];
    return fallingGiftView;
}

- (void)removeObjectInqueueArrMWith:(JJFallingGiftView *)giftView
{
    [self.enqueueArrM enumerateObjectsUsingBlock:^(JJFallingGiftView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == giftView) {
            [self.enqueueArrM removeObject:obj];
        }
    }];
}

#pragma mark - JJFallingGiftViewDelegate

- (void)didFallingAnimationFinishedWithView:(JJFallingGiftView *)view
{
    [self.dequeueArrM addObject:view];
    [self removeObjectInqueueArrMWith:view];
}

@end
