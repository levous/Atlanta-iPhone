//
//  SynchronizationCoordinator.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/16/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronizationCoordinator : NSObject
+ (void)subscribeForSaveNotificationOnManagedObjectContext:(NSManagedObjectContext *)managedContext;
+ (void)postNewUsers:(NSArray *)insertedEntities;
@end
