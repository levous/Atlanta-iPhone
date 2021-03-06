//
//  UserService.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevousStackMobService.h"

@interface UserService : LevousStackMobService

@property(assign, nonatomic) id delegate;

- (id)initWithDelegate:(id)aDelegate;

- (void)getAllUsers;
- (void)postNewUsers:(NSArray *)usersArray;

@end
