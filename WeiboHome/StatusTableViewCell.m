
//
//  StatusTableViewCell.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "StatusTableViewCell.h"
#import "Status.h"

@interface StatusTableViewCell()
@property(nonatomic ,weak)UIImageView *imgViewIcon;
@property(nonatomic, weak)UILabel *lblName;
@property(nonatomic, weak)UIImageView *imgViewVip;
@property(nonatomic, weak)UILabel *lblText;
@property(nonatomic, weak)UIImageView *imgViewPicture;
@end

@implementation StatusTableViewCell

+ (instancetype)statusCellWithTableView:(UITableView *)tableView
{
    static NSString *cellId=@"StatusTableViewCell";
    StatusTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[StatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgViewIcon=[[UIImageView alloc] init];
        [self addSubview:imgViewIcon];
        self.imgViewIcon=imgViewIcon;
        
        UILabel *lblName=[[UILabel alloc] init];
        [self addSubview:lblName];
        lblName.font=[UIFont systemFontOfSize:statusNameFontSize];
        self.lblName=lblName;
        
        UIImageView *imgViewVip=[[UIImageView alloc] init];
        imgViewVip.image=[UIImage imageNamed:@"vip"];
        [self addSubview:imgViewVip];
        self.imgViewVip=imgViewVip;
        
        UILabel *lblText=[[UILabel alloc] init];
        [self addSubview:lblText];
        lblText.numberOfLines=0;
        lblText.font=[UIFont systemFontOfSize:statusNameFontSize];
        self.lblText=lblText;
        
        UIImageView *imgViewPicture=[[UIImageView alloc] init];
        [self addSubview:imgViewPicture];
        self.imgViewPicture=imgViewPicture;
    }
    return self;
}

-(void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame=statusFrame;
    Status *status=_statusFrame.status;
    
    self.imgViewIcon.frame=_statusFrame.iconRect;
    self.imgViewIcon.image=[UIImage imageNamed:status.icon];
    
    self.lblName.frame=_statusFrame.nameRect;
    self.lblName.text=status.name;
    
    if (status.isVip) {
        self.imgViewVip.frame=_statusFrame.vipRect;
        self.imgViewVip.hidden=NO;
        self.lblName.textColor=[UIColor redColor];
    }else{
        self.imgViewVip.hidden=YES;
    }
    
    self.lblText.frame=_statusFrame.textRect;
    self.lblText.text=status.text;
    
    if (status.picture) {
        self.imgViewPicture.frame=_statusFrame.pictureRect;
        self.imgViewPicture.image=[UIImage imageNamed:status.picture];
        self.imgViewPicture.hidden=NO;
    }else{
        self.imgViewPicture.hidden=YES;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)prepareForReuse{

    [super prepareForReuse];
    self.imgViewIcon.image=nil;
    self.imgViewPicture.image=nil;
    self.lblName.text=nil;
    self.lblText.text=nil;
}
@end
