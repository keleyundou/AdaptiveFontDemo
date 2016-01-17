//
//  UILabel+AdaptiveFont.m
//  AspectCellScaleDemo
//
//  Created by 冰点 on 16/1/16.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "UILabel+AdaptiveFont.h"
#import "AdaptiveFontUtility.h"

@implementation UILabel (AdaptiveFont)
@dynamic bd_AdaptiveFontSize;

//- (void)setFont:(UIFont *)font
//{
//    CGFloat scale = ([UIScreen mainScreen].bounds.size.width / 320);
//    printf("------------------------------->\n");
//    NSLog(@"fontName : %@", font.fontName);
//    NSLog(@"familyName : %@", font.familyName);
//    NSLog(@"scale : %f", scale);
//    NSLog(@"before : %.1f", font.pointSize);
//    CGFloat f = font.pointSize * scale;
//    font = [UIFont fontWithName:font.fontName size:f];
//    font = [UIFont systemFontOfSize:f];
//    NSLog(@"after : %.1f", f);
//    printf("\n------------------------------->\n");
//}

#define ADAPTIVE__FONT_SIZE_MINIMUM_VALUE 20
#define ADAPTIVE_FONT_SIZE_MAXIMUM_VALUE 30

-(UIFont *) adjustFontSizeToFillItsContents
{
    NSString* text = self.text;
    
    for (int i = ADAPTIVE_FONT_SIZE_MAXIMUM_VALUE; i>ADAPTIVE__FONT_SIZE_MINIMUM_VALUE; i--) {
        
        UIFont *font = [UIFont fontWithName:self.font.fontName size:(CGFloat)i];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font}];
        
        CGRect rectSize = [attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        if (rectSize.size.height <= self.frame.size.height) {
            return [UIFont fontWithName:self.font.fontName size:(CGFloat)i];
            break;
        }
    }
    return self.font;
}

#pragma mark -

- (void)setBd_AdaptiveFontSize:(CGFloat)bd_AdaptiveFontSize
{
    self.font = [UIFont fontWithName:self.font.fontName size:bd_AdaptiveFontSize];
}

@end
