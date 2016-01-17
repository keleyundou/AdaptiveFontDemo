//
//  UILabel+AdaptiveFont.h
//  AspectCellScaleDemo
//
//  Created by 冰点 on 16/1/16.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UILabel (AdaptiveFont)


-(UIFont *) adjustFontSizeToFillItsContents;

@property (nonatomic, assign) IBInspectable CGFloat bd_AdaptiveFontSize;

@end
