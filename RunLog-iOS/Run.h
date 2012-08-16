//
//  Run.h
//  RunLog-iOS
//
//  Created by Steve Derico on 8/16/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Run : NSManagedObject

@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSDate * created_at;

@end
