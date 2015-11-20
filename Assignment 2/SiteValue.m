//
//  SiteValue.m
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import "SiteValue.h"

@implementation SiteValue

//getter for username
- (NSString *)getUsername {
    return username;
}

//setter for username
- (void)setUsername:(NSString *)name {
    username = name;
}

//getter for password
- (NSString *)getPassword {
    return password;
}

//setter for password
- (void)setPassword:(NSString *)pass {
    password = pass;
}

//getter for website
- (NSString *)getWebsite {
    return website;
}

//setter for website
- (void)setWebsite:(NSString *)web {
    website = web;
}

//getter for count
- (int)getCount {
    return count;
}

//setter for count (sets it to 0)
- (void)setCount: (int)num {
    count = num;
}

//increments count by 1
- (void)incrementCount {
    count++;
}

//print the SiteValue object's username, password, and count
- (void)print {
    NSLog(@"Username: %@ Password: %@ Count: %d", username, password, count);
}

@end
