//
//  AddViewController.m
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "AddViewController.h"
#import "MainViewController.h"
#import "SiteValue.h"

@implementation AddViewController

@synthesize passedIndex;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //close the keyboard if the user taps out of the keyboard
    [self.view endEditing: YES];
}

- (IBAction)enterPressed:(id)sender {
    //check if any of the fields are empty and show a popup if they aren't
    if ([self.websiteField.text isEqualToString: @""] || [self.nameField.text isEqualToString: @""] || [self.passwordField.text isEqualToString: @""] || [self.countField.text isEqualToString: @""]) {
        UIAlertController *alert=   [UIAlertController
                                      alertControllerWithTitle: @"Missing Information"
                                      message: @"Please fill out all of the text fields"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction
                                    actionWithTitle: @"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                    }];
        [alert addAction: okButton];
        [self presentViewController: alert animated: YES completion: nil];
    }
    //otherwise pass the information in the fields back to the main view
    else {
        self.passingValue = [[SiteValue alloc]init];
        [self.passingValue setWebsite: self.websiteField.text];
        [self.passingValue setUsername: self.nameField.text];
        [self.passingValue setPassword: self.passwordField.text];
        [self.passingValue setCount: [self.countField.text intValue]];
    
        [self performSegueWithIdentifier: @"recordAddedSegue" sender: sender];

    }
}

//controls the function of the return button for each of the fields
- (IBAction)hitNext:(UITextField *)sender {
    //move the focus to the next field
    if ([sender.restorationIdentifier isEqualToString: @"webField"]) {
        [self.nameField becomeFirstResponder];
    }
    else if ([sender.restorationIdentifier isEqualToString: @"nameField"]) {
        [self.passwordField becomeFirstResponder];
    }
    else if ([sender.restorationIdentifier isEqualToString: @"passwordField"]) {
        [self.countField becomeFirstResponder];
    }
    else if ([sender.restorationIdentifier isEqualToString: @"countField"]) {
        [self.view endEditing: YES];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //send the SiteValue, passed index, and total counts back to the main view
    if([segue.identifier isEqualToString:@"recordAddedSegue"]){
        MainViewController *controller = (MainViewController *)segue.destinationViewController;
        controller.passedValue = self.passingValue;
        controller.currentIndex = self.passedIndex;
        controller.fromStats = 0;
        controller.totalCounts = self.passedCount + [self.countField.text intValue];
    }
}

@end
