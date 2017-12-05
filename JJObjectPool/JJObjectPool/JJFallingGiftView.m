//
//  JJFallingGiftView.m
//  JJObjectPool
//
//  Created by lucy on 2017/12/4.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJFallingGiftView.h"

@implementation JJFallingGiftView

- (void)doAnimtion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFallingAnimationFinishedWithView:)]) {
            [self.delegate didFallingAnimationFinishedWithView:self];
        }
    });
}

@end
