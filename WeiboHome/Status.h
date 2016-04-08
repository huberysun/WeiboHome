//
//  Status.h
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import <Foundation/Foundation.h>
#define statusNameFontSize 13

@interface Status : NSObject
@property(nonatomic, copy)NSString *text;
@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *picture;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign,getter=isVip)BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)statusWithDic:(NSDictionary *)dic;
@end
