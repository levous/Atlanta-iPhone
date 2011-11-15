//
//  LeVousAppDelegate.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/14/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeVousAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
