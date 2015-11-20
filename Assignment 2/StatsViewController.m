//
//  StatsViewController.m
//  Assignment 2
//
//  Created by Kevin on 10/6/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "StatsViewController.h"
#import "MainViewController.h"

@implementation StatsViewController

@synthesize passedRecords;
@synthesize passedCount;
@synthesize passedIndex;

- (void)viewDidLoad {
    //load the information into the UI
    self.recordsLabel.text = [NSString stringWithFormat: @"Number of Records: %d", self.passedRecords];
    self.countLabel.text = [NSString stringWithFormat: @"Total Counts: %d", self.passedCount];
}

- (IBAction)returnPressed:(id)sender {
    //switch back to the main view
    [self performSegueWithIdentifier: @"returnSegue" sender: sender]; //segue to the new view
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //pass the passed index, passed count, and indicate that the view is coming from the stats view
    if([segue.identifier isEqualToString:@"returnSegue"]){
        MainViewController *controller = (MainViewController *)segue.destinationViewController;
        controller.fromStats = 1;
        controller.currentIndex = self.passedIndex;
        controller.totalCounts = self.passedCount;
    }
}



@end
