//
//  StatusFrame.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"
#import <CoreGraphics/CoreGraphics.h>

@interface StatusFrame : NSObject
@property(nonatomic, strong)Status *status;

@property(nonatomic, assign)CGRect iconRect;
@property(nonatomic, assign)CGRect nameRect;
@property(nonatomic, assign)CGRect vipRect;
@property(nonatomic, assign)CGRect textRect;
@property(nonatomic, assign)CGRect pictureRect;

@property(nonatomic, assign)CGFloat cellHeight;
@end
