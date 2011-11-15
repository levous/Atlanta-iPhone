//
//  UserServiceTests.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "UserServiceTests.h"
#import "UserService.h"

@implementation UserServiceTests


- (void)testGetAllUsers
{
    UserService *service = [[UserService alloc] initWithDelegate:self];
    
    [self prepare:@selector(testGetAllUsers)];
    
    [service getAllUsers];
    
    // Wait until notify called for timeout (seconds); If notify is not called with kGHUnitWaitStatusSuccess then
    // an error will be thrown
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

    
    GHAssertGreaterThan((NSUInteger)[userResults count], (NSUInteger)0, @"Should have gotten some users.");
}

#pragma mark - Service Delegate Callbacks

- (void)successWithData:(id)data{
    userResults = (NSArray *)data;
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testGetAllUsers)];
}

- (void)failureWithError:(id)data{
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testGetAllUsers)];
}

@end
