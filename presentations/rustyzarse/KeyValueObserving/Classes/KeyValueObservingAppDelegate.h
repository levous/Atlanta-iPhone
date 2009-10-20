//
//  KeyValueObservingAppDelegate.h
//  KeyValueObserving
//
//  Created by Rusty Zarse on 10/20/09.
//  Copyright Phone Owner 2009. All rights reserved.
//
@class Square;

@interface KeyValueObservingAppDelegate : NSObject <UIApplicationDelegate,UITextFieldDelegate> {

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
	UITextField *sizeTextField;
    UIWindow *window;
	UIView *squareView;
	Square *square;
}

- (IBAction)saveAction:sender;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, readonly) NSString *applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

