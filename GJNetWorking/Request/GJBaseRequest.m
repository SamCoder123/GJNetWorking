//
//  GJBaseRequest.m
//  GJNetWorking
//
//  Created by wangyutao on 15/11/13.
//  Copyright © 2015年 wangyutao. All rights reserved.
//

#import "GJBaseRequest.h"
#import "GJHTTPManager.h"

//被废弃了
//#import "AFHTTPRequestOperation.h"


@interface GJBaseRequest (){

}

@property (readwrite, nonatomic) GJRequestState state;
@property (nonatomic, copy, readwrite) GJCompletedBlock completedBlock;
@property (nonatomic, copy, readwrite) GJRequestFinishedBlock successBlock;
@property (nonatomic, copy, readwrite) GJRequestFinishedBlock failedBlock;
@property (nonatomic, readwrite, strong) id status;

@end

@implementation GJBaseRequest

//default method is 'GET'
- (GJRequestMethod)method {
    return GJRequestGET;
}

- (void)start {
    self.state = GJRequestStateExcuting;
    [[GJHTTPManager sharedManager] startRequest:self];
}

- (void)startWithSuccessBlock:(GJRequestFinishedBlock)success
                  failedBlock:(GJRequestFinishedBlock)failed {
    self.successBlock = success;
    self.failedBlock = failed;
    [self start];
}

- (void)startWithCompletedBlock:(GJCompletedBlock)completedBlock {
    self.completedBlock = completedBlock;
    [self start];
}

- (void)cancel {
    if ([[GJHTTPManager sharedManager] cancelRequest:self]) {
        self.state = GJRequestStateCanceled;
    }
}

- (void)retry {
    if (self.state == GJRequestStateFinished) {
        _currentRetryTimes ++;
        [self start];
    }
}

- (NSUInteger)retryTimes {
    return 0;
}

- (BOOL)isRequestSuccessed {
    return !self.error;
}

- (BOOL)isCanceled {
    //先注释
    return YES;
}

- (BOOL)isNetWorking{
    return self.state == GJRequestStateExcuting;
}

- (NSError *)error {
    return self.task.error;
}

- (id)responseObject {
    
    return nil;
}

- (id)responseJson {
    
    return nil;
    
}
- (void)requestCompletedWithModel:(id)model{
    self.state = GJRequestStateFinished;
    
    BOOL success = !self.error;
    id responseObject = model;
    

    
    //call back
    if (success && self.successBlock) {
        self.successBlock(responseObject, self.status, nil);
    }
    
    if (!success && self.failedBlock) {
        self.failedBlock(responseObject, nil, self.error);
    }
    
    !self.completedBlock ? : self.completedBlock(self);
    
    self.successBlock = nil;
    self.failedBlock = nil;
    self.completedBlock = nil;
}
- (void)requestCompletedWithObj:(id)obj andModelObjBlock:(void (^)(id model))modelBlock{
    
}


@end
