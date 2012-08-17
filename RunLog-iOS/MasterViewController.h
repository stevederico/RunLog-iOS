//
//  MasterViewController.h
//  RunLog-iOS
//
//  Created by Steve Derico on 8/14/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "SSPullToRefresh.h"
#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, SSPullToRefreshViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) SSPullToRefreshView *pullToRefreshView;
@end
