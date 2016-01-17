//
//  ViewController.m
//  AspectCellScaleDemo
//
//  Created by 冰点 on 16/1/15.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "ViewController.h"
#import "NPCHomeJobCell.h"

@interface ViewController ()< UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NPCHomeJobCell *cell = [NPCHomeJobCell cellWithTableView:tableView indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 124.0;
    return height * ([UIScreen mainScreen].bounds.size.width / 320);//按比例缩放
//    return height;
}


@end
