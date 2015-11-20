//
//  SiteValue.h
//  Assignment 2
//
//  Created by Kevin on 10/5/15.
//  Copyright © 2015 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SiteValue : NSObject
{
    int count;
    NSString *username;
    NSString *password;
    NSString *website;
}

- (NSString *)getUsername;
- (void)setUsername:(NSString *)name;

- (NSString *)getPassword;
- (void)setPassword:(NSString *)pass;

- (NSString *)getWebsite;
- (void)setWebsite:(NSString *)web;

- (int)getCount;
- (void)setCount: (int)num;
- (void)incrementCount;

- (void)print;

@end
