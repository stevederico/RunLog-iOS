//
//  RunLogAPIClient.m
//  RunLog-iOS
//
//  Created by Steve Derico on 8/14/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
//static NSString * const kAFIncrementalStoreExampleAPIBaseURLString = @"http://localhost:3000";
static NSString * const kAFIncrementalStoreExampleAPIBaseURLString = @"http://runlogapp.com";


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
        NSNumber *distance = [NSNumber numberWithDouble:[[representation valueForKey:@"distance"] doubleValue]];
        [mutablePropertyValues setValue:distance forKey:@"distance"];
//        [NSNull null]
//        NSNumber *duration = ((NSNull *)[NSNumber numberWithDouble:[[representation valueForKey:@"duration"] doubleValue]] != [NSNull null]) ? [NSNumber numberWithDouble:[[representation valueForKey:@"duration"] doubleValue]]: nil;
        [mutablePropertyValues setValue:[NSNumber numberWithDouble:12.0] forKey:@"duration"];
        
        NSString *summary = [representation valueForKey:@"description"];
        [mutablePropertyValues setValue:summary forKey:@"summary"];
        
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        //Wed Dec 01 17:08:03 +0000 2010
        //"2012-07-24T22:47:40Z";
        NSString *input = [representation valueForKey:@"created_at"];
        input =  [input stringByReplacingOccurrencesOfString:@"Z" withString:@"-0000"];
        [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        NSDate *date = [df dateFromString:input];

        [mutablePropertyValues setValue:date forKey:@"created_at"];
        
        NSString *dateStr = [df stringFromDate:date];
        NSLog(@"Date String %@",dateStr);
        
    }
    
    NSLog(@"RUN %@",[mutablePropertyValues description]);
    
    return mutablePropertyValues;
}


@end
