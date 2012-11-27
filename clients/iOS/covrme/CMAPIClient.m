//
//  CMAPIClient.m
//  covrme
//
//  Created by Anthony Wong on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMAPIClient.h"
#import "AFJSONRequestOperation.h"


@implementation CMAPIClient
+ (CMAPIClient *)sharedClient {
    static CMAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://covrme.herokuapp.com/"]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
	
    [self setDefaultHeader:@"user-agent" value:@"covrme"];
    return self;
}

- (void)getTransactionsWithSuccess:(getTransSuccessBlock)success failure:(getTransFailureBlock)failure
{
    [self getPath:@"transactions.json" 
       parameters:nil 
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              NSLog(@"Successful Result!");
          } 
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Failed Result.. :(");
          }];
}

- (void)postTransactionsWithParameters:(NSDictionary*)params success:(postTransSuccessBlock)success failure:(postTransFailureBlock)failure
{
    [self postPath:@"transactions"
        parameters:params
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               //
           } 
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               //
           }
     ];
}
@end
