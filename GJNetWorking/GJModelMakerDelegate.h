//
//  GJModelMakerDelegate.h
//  GJNetWorking
//
//  Created by wangyutao on 15/11/17.
//  Copyright © 2015年 wangyutao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GJModelMakerDelegate <NSObject>

@optional

+ (id)makeModelWithJSON:(NSDictionary *)json
                  class:(Class)modelClass
                 status:(id __autoreleasing *)status;

@end