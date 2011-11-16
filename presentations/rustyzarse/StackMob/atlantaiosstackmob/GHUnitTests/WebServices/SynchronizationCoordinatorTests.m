//
//  SynchronizationCoordinatorTests.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/16/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "SynchronizationCoordinatorTests.h"
#import "SynchronizationCoordinator.h"
#import "GHUnitAtlantaIOSAppDelegate.h"
#import "UserService.h"
#import <CoreData/CoreData.h>

@implementation SynchronizationCoordinatorTests

- (void)test_Save_New_User_Syncs
{
    
    GHUnitAtlantaIOSAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [[appDelegate appCoreDataManager] managedObjectContext];
    
    [SynchronizationCoordinator subscribeForSaveNotificationOnManagedObjectContext:context];
    
    NSManagedObject *newManagedObject = (NSManagedObject *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    
    
    [newManagedObject setValue:@"atest%@" forKey:@"username"];
    [newManagedObject setValue:@"atest" forKey:@"password"];
    [newManagedObject setValue:@"atest" forKey:@"twitterHandle"];
    
    // Save the context.
    NSError *error = nil;
    
    //[self prepare:@selector(testGetAllUsers)];
    
    
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    // Wait until notify called for timeout (seconds); If notify is not called with kGHUnitWaitStatusSuccess then
    // an error will be thrown
    //[self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    
}

// mobile

@end
