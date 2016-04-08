//
//  Status.m
//  TableViewUsing
//
//  Created by HuberySun on 16/4/8.
//  Copyright © 2016年 HuberySun. All rights reserved.
//

#import "Status.h"

@implementation Status
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)statusWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
@end
