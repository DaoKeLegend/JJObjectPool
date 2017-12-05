//
//  JJFallingGiftView.h
//  JJObjectPool
//
//  Created by lucy on 2017/12/4.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JJFallingGiftView;

@protocol JJFallingGiftViewDelegate <NSObject>

//动画完成
- (void)didFallingAnimationFinishedWithView:(JJFallingGiftView *)view;

@end

@interface JJFallingGiftView : UIView

@property (nonatomic, weak) id<JJFallingGiftViewDelegate>delegate;

- (void)doAnimtion;

@end
