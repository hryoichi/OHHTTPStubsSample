//
//  OHHTTPStubsSampleTests.m
//  OHHTTPStubsSampleTests
//
//  Created by Ryoichi Hara on 2014/04/12.
//  Copyright (c) 2014年 Ryoichi Hara. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHHTTPStubsResponse+JSON.h>
#import "HRYAPIManager.h"

SpecBegin(HRYAPIManager)

describe(@"HRYAPIManager", ^{
    __block HRYAPIManager *manager;

    beforeEach(^{
        manager = [HRYAPIManager sharedManager];

        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return [request.URL.host isEqualToString:@"api.hryoichi.com"];
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            id JSONObject = @{@"message": @"Hello, OHHTTPStubs!"};
            return [OHHTTPStubsResponse responseWithJSONObject:JSONObject statusCode:200 headers:nil];
        }];
    });

    afterEach(^{
        [OHHTTPStubs removeAllStubs];
    });

    it(@"should not be nil", ^AsyncBlock {
        __block id result = nil;

        [manager GET:@"/" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            result = responseObject;
            done();
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            done();
        }];

        EXP_expect(result[@"message"]).will.equal(@"Hello, OHHTTPStubs!");
    });
});

SpecEnd