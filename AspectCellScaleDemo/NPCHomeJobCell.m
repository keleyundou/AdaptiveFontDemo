//
//  NPCHomeJobCell.m
//  neipinJob
//
//  Created by 冰点 on 15/11/10.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import "NPCHomeJobCell.h"
#import "UILabel+AdaptiveFont.h"
#import "UIFont+AdaptiveFont.h"

@implementation NPCHomeJobCell
@synthesize indexPath = indexPath_;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIdentifier = @"NPCHomeJobCell";
    NPCHomeJobCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NPCHomeJobCell class]) owner:self options:nil] firstObject];
        cell.indexPath = indexPath;
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (CGFloat)heightForRow;
{
    return 124;
}

//- (void)setJobNameLabel:(BDLabel *)jobNameLabel
//{
//    _jobNameLabel = jobNameLabel;
//    UIFont *font = jobNameLabel.font;
//    jobNameLabel.font = [UIFont fontWithName:font.fontName size:font.pointSize];
//}
//
//- (void)setOtherLabel:(BDLabel *)otherLabel{
//    _otherLabel = otherLabel;
//    UIFont *font = otherLabel.font;
//    otherLabel.font = [UIFont fontWithName:font.fontName size:font.pointSize];
//}

- (void)layoutSubviews
{
//    NSLog(@"------>%@", NSStringFromCGRect(self.contentView.frame));
}


@end
