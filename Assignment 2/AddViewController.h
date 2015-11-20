//
//  AddViewController.h
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SiteValue.h"

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *websiteField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@property (nonatomic) SiteValue *passingValue;
@property (nonatomic) int passedIndex;
@property (nonatomic) int passedCount;

@end
