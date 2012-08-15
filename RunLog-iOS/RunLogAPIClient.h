//
//  RunLogAPIClient.h
//  RunLog-iOS
//
//  Created by Steve Derico on 8/14/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "AFIncrementalStore.h"
#import "AFRESTClient.h"

@interface RunLogAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>
+ (RunLogAPIClient *)sharedClient;


@end
