//
//  MYRequest.m
//  GJNetWorking
//
//  Created by wangyutao on 15/11/16.
//  Copyright © 2015年 wangyutao. All rights reserved.
//

#import "MYRequest.h"
#import "Retdata.h"

@implementation MYRequest

- (NSString *)path{
    return @"microservice/cityinfo";
}

- (NSDictionary *)parameters{
    return @{@"cityname":@"北京",
            };
}

- (GJRequestMethod)method{
    return GJRequestGET;
}

- (Class)modelClass{
    return [Retdata class];
}

- (GJAPICachePolicy)cachePolicy {
    return GJUseAPICacheIfExistPolicy;
}

- (NSTimeInterval)cacheValidTime {
    return 60 * 60;
}

@end
