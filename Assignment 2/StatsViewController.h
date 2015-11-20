//
//  StatsViewController.h
//  Assignment 2
//
//  Created by Kevin on 10/6/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *recordsLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;
@property (nonatomic) int passedRecords;
@property (nonatomic) int passedCount;
@property (nonatomic) int passedIndex;

@end
