//
//  StatusTableViewCell.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusFrame.h"
@interface StatusTableViewCell : UITableViewCell
+ (instancetype)statusCellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)StatusFrame *statusFrame;
@end
