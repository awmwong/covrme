//
//  CMAPIClient.h
//  covrme
//
//  Created by Anthony Wong on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CMAPIClient : AFHTTPClient
+ (CMAPIClient*) sharedClient;

typedef void(^getTransSuccessBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSMutableArray *transArray);
typedef void(^getTransFailureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error);
- (void)getTransactionsWithSuccess:(getTransSuccessBlock)success failure:(getTransFailureBlock)failure;

typedef void(^postTransSuccessBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSMutableArray *transArray);
typedef void(^postTransFailureBlock)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error);
- (void)postTransactionsWithParameters:(NSDictionary*)params Success:(postTransSuccessBlock)success failure:(postTransFailureBlock)failure;


@end
