//
//  BDLabel.m
//  AspectCellScaleDemo
//
//  Created by 冰点 on 16/1/16.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "BDLabel.h"

@implementation BDLabel

- (void)awakeFromNib
{
    [self adjustFontSizeToFillItsContents];
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self adjustFontSizeToFillItsContents];
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self adjustFontSizeToFillItsContents];
    }
    return self;
}

- (void)adjustFontSizeToFillItsContents
{
    if (self.font) {
        //为hook铺垫
        self.font = [UIFont fontWithName:[self.font fontName] size:[self.font pointSize]];
        printf("orgValue: %f\n",[self.font pointSize]);
    }
}

@end
