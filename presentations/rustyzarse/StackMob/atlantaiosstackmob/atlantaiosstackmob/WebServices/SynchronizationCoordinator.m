//
//  SynchronizationCoordinator.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/16/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "SynchronizationCoordinator.h"
#import "UserService.h"

@implementation SynchronizationCoordinator
+ (void)subscribeForSaveNotificationOnManagedObjectContext:(NSManagedObjectContext *)managedContext{
    // subscribes at a class scope for save notification
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(managedObjectContextDidSave:) 
                                                 name:NSManagedObjectContextDidSaveNotification 
                                               object:managedContext];
}

+ (void)managedObjectContextDidSave:(NSNotification *)notification{
    NSManagedObjectContext *changedContext = (NSManagedObjectContext *)notification;
    NSArray *insertedObjects = [[changedContext userInfo] objectForKey:NSInsertedObjectsKey];
    if ([insertedObjects count] > 0) {
        // post new items
        [self postNewUsers:insertedObjects];
    }
}

// this will have to be changed to a instance method so that it can be synchronized (not fired all at once)
+ (void)postNewUsers:(NSArray *)insertedEntities{

    NSDictionary *propertyMap = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"username", @"username",
     @"password", @"password",
     @"twitterHandle", @"twitterhandle",
     nil];
     
     
    NSMutableArray *usersArray = [NSMutableArray array];
    for (NSManagedObject *item in insertedEntities) {
        if ([[[item entity] name] isEqualToString:@"User"]) {
            NSMutableDictionary *userDictionary = [NSMutableDictionary dictionary];
            for (NSString *key in [propertyMap allKeys]) {
                [userDictionary setObject:[item valueForKeyPath:[propertyMap objectForKey:key]] forKey:key];
                [usersArray addObject:userDictionary];
            }
        }
    }
    
    if ([usersArray count] > 0) {
        UserService *userService = [[UserService alloc] initWithDelegate:self];
        [userService postNewUsers:usersArray];
    }
}

+ (void)successWithData:(id)data{
    NSDictionary *newItemDict = (NSDictionary *)data;
    NSLog(@"added:\n%@", newItemDict);
}

+ (void)failureWithData:(id)data{
    NSLog(@"DERN");
}




@end
