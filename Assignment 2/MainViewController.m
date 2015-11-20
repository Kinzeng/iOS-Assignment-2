//
//  ViewController.m
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "MainViewController.h"
#import "AddViewController.h"
#import "StatsViewController.h"
#import "SiteValue.h"

@implementation MainViewController

@synthesize currentIndex;
@synthesize passedValue;
@synthesize totalCounts;
@synthesize fromStats;
NSMutableArray *array;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.passedValue && !self.fromStats) { //first time loading this view
        array = [[NSMutableArray alloc] init]; //initialize the array
        [self setCurrentIndex: 0]; //start at 0
        [self setTotalCounts: 0];
        
        //disable buttons because they can't work yet
        self.backButton.enabled = NO;
        self.backButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.forwardButton.enabled = NO;
        self.forwardButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.countButton.enabled = NO;
        self.countButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.statButton.enabled = NO;
        self.statButton.titleLabel.textColor = [UIColor lightGrayColor];
        self.slider.enabled = NO;
        self.slider.tintColor = [UIColor lightGrayColor];
        [self.slider setValue: 0.0 animated: YES];
    }
    else { //loaded this view after returning from another
        if (!self.fromStats)
            [array addObject: passedValue]; //add the record to the array
        
        //show the record
        SiteValue *value = [array objectAtIndex: self.currentIndex];
        //self.websiteField.text = self.passedValue;
        self.websiteField.text = value.getWebsite;
        self.nameField.text = value.getUsername;
        self.passwordField.text = value.getPassword;
        self.countField.text = [NSString stringWithFormat: @"%d", value.getCount];
        
        //disable and enable the buttons as necessary
        if (self.currentIndex == 0)
            self.backButton.enabled = NO;
        else
            self.backButton.enabled = YES;
        if (self.currentIndex == array.count - 1)
            self.forwardButton.enabled = NO;
        else
            self.forwardButton.enabled = YES;

        [self.backButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
        [self.forwardButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
        
        self.countButton.enabled = YES;
        self.slider.enabled = YES;
        self.statButton.enabled = YES;
        
        //move the slider to the correct position
        double segment = 1.0 / ((double)array.count - 1);
        [self.slider setValue: currentIndex * segment animated:YES];
    }
}

- (IBAction)backPressed:(id)sender {
    [self setCurrentIndex: self.currentIndex - 1]; //move back one record
    
    //display the record
    SiteValue *value = [array objectAtIndex: currentIndex];
    self.websiteField.text = value.getWebsite;
    self.nameField.text = value.getUsername;
    self.passwordField.text = value.getPassword;
    self.countField.text = [NSString stringWithFormat: @"%d", [value getCount]];
    
    //disable and enable the buttons as necessary
    if (self.currentIndex == 0)
        self.backButton.enabled = NO;
    else
        self.backButton.enabled = YES;
    if (self.currentIndex == array.count - 1)
        self.forwardButton.enabled = NO;
    else
        self.forwardButton.enabled = YES;
    
    [self.backButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
    [self.forwardButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
    
    //move the slider to the correct position
    double segment = 1.0 / ((double)array.count - 1);
    [self.slider setValue: currentIndex * segment animated:YES];
}

- (IBAction)countPressed:(id)sender {
    [self setTotalCounts: self.totalCounts + 1];
    SiteValue *value = [array objectAtIndex: currentIndex];
    [value incrementCount]; //increment the count
    self.countField.text = [NSString stringWithFormat: @"%d", [value getCount]]; //display the new count
}

- (IBAction)forwardPressed:(id)sender {
    [self setCurrentIndex: self.currentIndex + 1]; //move forward in the array
    
    //display the record
    SiteValue *value = [array objectAtIndex: currentIndex];
    self.websiteField.text = value.getWebsite;
    self.nameField.text = value.getUsername;
    self.passwordField.text = value.getPassword;
    self.countField.text = [NSString stringWithFormat: @"%d", [value getCount]];
    
    //disable and enable the buttons as necessary
    if (self.currentIndex == 0)
        self.backButton.enabled = NO;
    else
        self.backButton.enabled = YES;
    if (self.currentIndex == array.count - 1)
        self.forwardButton.enabled = NO;
    else
        self.forwardButton.enabled = YES;
    
    [self.backButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
    [self.forwardButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
    
    //move the slider to the correct position
    double segment = 1.0 / ((double)array.count - 1);
    [self.slider setValue: currentIndex * segment animated:YES];

}

- (IBAction)addPressed:(id)sender {
    [self performSegueWithIdentifier: @"addRecordSegue" sender: sender]; //segue to the new view
}

- (IBAction)statPressed:(id)sender {
    [self performSegueWithIdentifier: @"statisticsSegue" sender: sender]; //segue to the new view
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //pass the current index and the total counts to the other view
    if([segue.identifier isEqualToString:@"addRecordSegue"]){
        AddViewController *controller = (AddViewController *)segue.destinationViewController;
        controller.passedIndex = self.currentIndex;
        controller.passedCount = self.totalCounts;
    }
    //pass the number of records, the total count, and the current index
    if([segue.identifier isEqualToString:@"statisticsSegue"]){
        StatsViewController *controller = (StatsViewController *)segue.destinationViewController;
        controller.passedRecords = (int)array.count;
        controller.passedCount = self.totalCounts;
        controller.passedIndex = self.currentIndex;
    }
    
}

- (IBAction)sliderMoved:(id)sender {
    //take in the slider value
    double percentage = self.slider.value;
    double segment;
    //find out the closest index to the slider's value
    if (array.count == 1)
        self.currentIndex = 0;
    else {
        segment = 1.0 / ((double)array.count - 1);
        self.currentIndex = (int)lround(percentage / segment);
    }
    
    //snap the slider to the correct spot
    [self.slider setValue: currentIndex * segment animated:YES];
    
    //display the  record at that index
    SiteValue *value = [array objectAtIndex: currentIndex];
    self.websiteField.text = value.getWebsite;
    self.nameField.text = value.getUsername;
    self.passwordField.text = value.getPassword;
    self.countField.text = [NSString stringWithFormat: @"%d", [value getCount]];
    
    //disable and enable the buttons as necessary
    if (self.currentIndex == 0)
        self.backButton.enabled = NO;
    else
        self.backButton.enabled = YES;
    if (self.currentIndex == array.count - 1)
        self.forwardButton.enabled = NO;
    else
        self.forwardButton.enabled = YES;
    
    [self.backButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
    [self.forwardButton setTitleColor:[UIColor lightGrayColor] forState: UIControlStateDisabled];
}

@end
