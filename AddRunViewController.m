//
//  AddRunViewController.m
//  RunLog-iOS
//
//  Created by Steve Derico on 8/16/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import "AddRunViewController.h"

@interface AddRunViewController ()

@end

@implementation AddRunViewController
@synthesize distanceTextField;
@synthesize durationTextField;
@synthesize NotesTextView;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = closeButton;
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveRun:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [self.distanceTextField becomeFirstResponder];
    [self.scrollView setContentSize:CGSizeMake(320, 500)];
    [self.distanceTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    
}

- (void)viewDidUnload
{
    [self setDistanceTextField:nil];
    [self setDurationTextField:nil];
    [self setNotesTextView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)close{

    [self.navigationController dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)saveRun:(id)sender {
    NSManagedObjectContext *context = [(id)[[UIApplication sharedApplication] delegate] managedObjectContext];
    Run *myRun = [NSEntityDescription insertNewObjectForEntityForName:@"Run"
                                    inManagedObjectContext:context];
    myRun.distance = [NSNumber numberWithDouble:[self.distanceTextField.text doubleValue]];
    [context save:nil];
    
    
    [self close];
     
}
@end
