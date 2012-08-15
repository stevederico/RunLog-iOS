//
//  RunLogAPIClient.m
//  RunLog-iOS
//
//  Created by Steve Derico on 8/14/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
//static NSString * const kAFIncrementalStoreExampleAPIBaseURLString = @"http://localhost:3000";
static NSString * const kAFIncrementalStoreExampleAPIBaseURLString = @"http://www.runlogapp.com";


#import "RunLogAPIClient.h"

@implementation RunLogAPIClient

+ (RunLogAPIClient *)sharedClient {
    static RunLogAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAFIncrementalStoreExampleAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (NSDictionary *)attributesForRepresentation:(NSDictionary *)representation
                                     ofEntity:(NSEntityDescription *)entity
                                 fromResponse:(NSHTTPURLResponse *)response
{
    NSMutableDictionary *mutablePropertyValues = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
    if ([entity.name isEqualToString:@"Run"]) {
        NSString *description = [representation valueForKey:@"description"];
        [mutablePropertyValues setValue:description forKey:@"runDescription"];
    }
    
    return mutablePropertyValues;
}


@end
