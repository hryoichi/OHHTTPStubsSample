//
//  HRYAPIManager.h
//  OHHTTPStubsSample
//
//  Created by Ryoichi Hara on 2014/04/12.
//  Copyright (c) 2014年 Ryoichi Hara. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HRYAPIManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
