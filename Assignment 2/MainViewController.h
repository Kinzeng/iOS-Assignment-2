//
//  ViewController.h
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SiteValue.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *websiteField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *countButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *statButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic) int currentIndex;
@property (weak, nonatomic) SiteValue *passedValue;
@property (nonatomic) int totalCounts;
@property (nonatomic) int fromStats;

@end

