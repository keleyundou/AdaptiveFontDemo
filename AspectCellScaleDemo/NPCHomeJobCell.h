//
//  NPCHomeJobCell.h
//  neipinJob
//
//  Created by 冰点 on 15/11/10.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDLabel.h"

@interface NPCHomeJobCell : UITableViewCell
{
    @private
    NSIndexPath *indexPath_;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@property (nonatomic, copy) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet BDLabel *jobNameLabel;// 招聘职位
@property (weak, nonatomic) IBOutlet BDLabel *otherLabel;

+ (CGFloat)heightForRow;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cont;

@end
