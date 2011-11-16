//
//  CoreDataManager.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/16/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
