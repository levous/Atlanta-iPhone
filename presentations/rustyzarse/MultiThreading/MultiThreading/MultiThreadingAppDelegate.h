//
//  MultiThreadingAppDelegate.h
//  MultiThreading
//
//  Created by Rusty Zarse on 4/19/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiThreadingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
