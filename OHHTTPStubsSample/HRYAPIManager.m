//
//  HRYAPIManager.m
//  OHHTTPStubsSample
//
//  Created by Ryoichi Hara on 2014/04/12.
//  Copyright (c) 2014年 Ryoichi Hara. All rights reserved.
//

#import "HRYAPIManager.h"

static NSString * const kAPIBaseURLString = @"http://api.hryoichi.com";

@implementation HRYAPIManager

+ (instancetype)sharedManager {
    static HRYAPIManager *_sharedManager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _sharedManager = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
    });
    
    return _sharedManager;
}

@end
