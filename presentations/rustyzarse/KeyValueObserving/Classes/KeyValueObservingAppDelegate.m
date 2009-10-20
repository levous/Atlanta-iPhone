//
//  KeyValueObservingAppDelegate.m
//  KeyValueObserving
//
//  Created by Rusty Zarse on 10/20/09.
//  Copyright Phone Owner 2009. All rights reserved.
//

#import "KeyValueObservingAppDelegate.h"
#import "Square.h"

@implementation KeyValueObservingAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch 
	CGRect frame = [window frame];
	// add a text input field
	sizeTextField = [[UITextField alloc] initWithFrame:CGRectMake( 10.0, 40.0, 120.0, 40.0 )];
	[sizeTextField setDelegate:self];
	[sizeTextField setText:@"100"];
	[window addSubview:sizeTextField];
	
	// add a +20 button
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:CGRectMake( 140.0, 40.0, 120.0, 40.0 )];
	[button setTitle:@"+20" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(add20buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
	[window addSubview:button];
	
	// create that square
	square = [[Square alloc] initWithSideLength:100 andCanvasWidth:frame.size.width andHeight:frame.size.height];
	CGRect squareFrame = [square getCenteredFrame];
	// create the square view
	squareView = [[UIView alloc] initWithFrame:squareFrame];
	[squareView setBackgroundColor:[UIColor redColor]];
	
	// observe the square
	[square addObserver:self forKeyPath:@"sideLength" options:0 context:nil];
	
	/*[window setMultipleTouchEnabled:NO];
	[window setUserInteractionEnabled:NO];
	[squareView setMultipleTouchEnabled:NO];
	[squareView setUserInteractionEnabled:NO];*/
	
	
	[window addSubview:squareView];
	[squareView release];

	[window makeKeyAndVisible];
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	
    NSError *error;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Handle error
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			exit(-1);  // Fail
        } 
    }
}

#pragma mark JKey Value Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	[sizeTextField setText:[NSString stringWithFormat:@"%.3f", [square sideLength]]];
	[squareView setFrame:[square getCenteredFrame]];
}

#pragma mark Touches

- (void)add20buttonHandler:(id)sender
{
	[square setSideLength:[square sideLength] + 20];
}




- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
	
	//Get all the touches.
	NSSet *allTouches = [event allTouches];
	
	//Number of touches on the screen
	switch ([allTouches count])
	{
		case 1:
		{
			//Get the first touch.
			UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			
			switch([touch tapCount])
			{
				case 1://Single tap
					if( [square sideLength] > 20 ) [square setSideLength:[square sideLength] - 20];
					break;
				case 2://Double tap.
					[square setSideLength:[square sideLength] + 20];
					break;
			}
		} 
			break;
	}
	
}

#pragma mark UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if (theTextField == sizeTextField) {
		[sizeTextField resignFirstResponder];
	}
	return YES;
} 

- (void)textFieldDidEndEditing:(UITextField *)textField{
	[square setSideLength:[[textField text] floatValue]];
}

#pragma mark -
#pragma mark Saving

/**
 Performs the save action for the application, which is to send the save:
 message to the application's managed object context.
 */
- (IBAction)saveAction:(id)sender {
	
    NSError *error;
    if (![[self managedObjectContext] save:&error]) {
		// Handle error
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"KeyValueObserving.sqlite"]];
	
	NSError *error;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        // Handle error
    }    
	
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    
	[window release];
	[super dealloc];
}


@end

