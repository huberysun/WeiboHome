//
//  ViewController.m
//  WeiboHome
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "StatusFrame.h"
#import "StatusTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)NSArray *statusFrames;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (NSArray *)statusFrames{
    if (!_statusFrames) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"microblog.plist" ofType:nil];
        NSArray *statuses=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM=[NSMutableArray array];
        for (NSDictionary *dic in statuses) {
            Status *s=[Status statusWithDic:dic];
            StatusFrame *statusFrame=[[StatusFrame alloc] init];
            statusFrame.status=s;
            [arrM addObject:statusFrame];
        }
        _statusFrames=arrM;
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}

#pragma mark -UITableViewDataSource 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrames.count;
}

- (UITableViewCell *)
tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusFrame *statusFrame=[self.statusFrames objectAtIndex:indexPath.row];
    
    StatusTableViewCell *statusCell=[StatusTableViewCell statusCellWithTableView:tableView];
    
    statusCell.statusFrame
    =statusFrame;
    
    return statusCell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusFrame *statusFrame=[self.statusFrames objectAtIndex:indexPath.row];
    return statusFrame.cellHeight;
}

@end
