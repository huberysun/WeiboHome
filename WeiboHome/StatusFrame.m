//
//  StatusFrame.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "StatusFrame.h"
#import <UIKit/UIKit.h>

@implementation StatusFrame
- (void)setStatus:(Status *)status{
    _status=status;
    
    CGFloat margin=10;
    
    CGFloat iconW=40;
    CGFloat iconH=40;
    CGFloat iconX=margin;
    CGFloat iconY=margin;
    self.iconRect=CGRectMake(iconX, iconY, iconW, iconH);
    
    CGRect namebBoundingRect=[status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:statusNameFontSize]} context:nil];
    CGFloat nameX=CGRectGetMaxX(self.iconRect)+margin;
    CGFloat nameY=CGRectGetMidX(self.iconRect)-namebBoundingRect.size.height/2;
    self.nameRect=CGRectMake(nameX, nameY, namebBoundingRect.size.width, namebBoundingRect.size.height);
    
    CGFloat vipW=10;
    CGFloat vipH=10;
    CGFloat vipX=CGRectGetMaxX(self.nameRect)+margin;
    CGFloat vipY=CGRectGetMidX(self.iconRect)-vipH/2;
    self.vipRect=CGRectMake(vipX, vipY, vipW, vipH);
    
    CGFloat maxW=[[UIScreen mainScreen] bounds].size.width-2*margin;
    CGRect textBoundingRect=[status.text boundingRectWithSize:CGSizeMake(maxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:statusNameFontSize]} context:nil];
    CGFloat textX=CGRectGetMinX(self.iconRect);
    CGFloat textY=CGRectGetMaxY(self.iconRect)+margin;
    CGFloat textW=textBoundingRect.size.width;
    CGFloat textH=textBoundingRect.size.height;
    self.textRect=CGRectMake(textX, textY, textW, textH);
    
    if (status.picture) {
        CGFloat pictureW=80;
        CGFloat pictureH=80;
        CGFloat pictureX=CGRectGetMinX(self.iconRect);
        CGFloat pictureY=CGRectGetMaxY(self.textRect)+margin;
        self.pictureRect=CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        self.cellHeight=CGRectGetMaxY(self.pictureRect)+margin;
    }else{
        self.cellHeight=CGRectGetMaxY(self.textRect)+margin;
    }
}
@end
