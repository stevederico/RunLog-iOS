//
//  RunLogIncrementalStore.m
//  RunLog-iOS
//
//  Created by Steve Derico on 8/15/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "RunLogAPIClient.h"
#import "RunLogIncrementalStore.h"

@implementation RunLogIncrementalStore

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}

+ (NSString *)type {
    return NSStringFromClass(self);
}

+ (NSManagedObjectModel *)model {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"RunLog_iOS" withExtension:@"xcdatamodeld"]];
}

- (id<AFIncrementalStoreHTTPClient>)HTTPClient {
    return [RunLogAPIClient sharedClient];
}

@end
