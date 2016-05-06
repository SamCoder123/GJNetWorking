//
//  ViewController.m
//  XinWeiWu
//
//  Created by halong33 on 16/3/2.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import "ViewController.h"
#import "MYRequest.h"
#import "Retdata.h"
#import "GCStatus.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //模拟接口的调用
    MYRequest *request = [MYRequest new];
    [request startWithSuccessBlock:^(id responseObject, id status, NSError *error) {
        
        Retdata *model = (Retdata*)responseObject;
        GCStatus *statue = (GCStatus *)status;
        NSLog(@"城市名: %@",model.cityName);
        
    } failedBlock:^(id responseObject, id status, NSError *error) {
        
    }];
}


@end
