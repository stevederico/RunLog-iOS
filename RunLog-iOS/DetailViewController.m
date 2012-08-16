//
//  DetailViewController.m
//  RunLog-iOS
//
//  Created by Steve Derico on 8/14/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize distanceLabel;
@synthesize durationLabel;
@synthesize paceLabel;
@synthesize descriptionTextView;
@synthesize dateLabel;

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
  self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (self.detailItem) {
        self.descriptionTextView.text = [[self.detailItem valueForKey:@"summary"] description];
        self.distanceLabel.text = [[self.detailItem valueForKey:@"distance"] description];
        self.durationLabel.text = [[self.detailItem valueForKey:@"duration"] description];
        
        double duration = [self.durationLabel.text doubleValue];
        double distance = [self.distanceLabel.text doubleValue];
        double pace = duration / distance;
        double i;
        double r = modf(pace, &i);
        double secs = r*60;
        self.paceLabel.text = [NSString stringWithFormat:@"%.0f:%02.0f",i,secs];
        
        self.dateLabel.text = [[self.detailItem valueForKey:@"created_at"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (void)viewDidUnload
{
    [self setPaceLabel:nil];
    [self setDurationLabel:nil];
    [self setDistanceLabel:nil];
    [self setDescriptionTextView:nil];
    [self setDateLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
  
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
