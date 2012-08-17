//
//  AddRunViewController.h
//  RunLog-iOS
//
//  Created by Steve Derico on 8/16/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "Run.h"
#import <UIKit/UIKit.h>

@interface AddRunViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *distanceTextField;
@property (strong, nonatomic) IBOutlet UITextField *durationTextField;
@property (strong, nonatomic) IBOutlet UITextView *NotesTextView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)saveRun:(id)sender;

@end
