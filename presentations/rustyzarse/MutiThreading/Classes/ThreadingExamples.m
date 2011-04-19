//
//  ThreadingExamples.m
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "ThreadingExamples.h"
#import "MultiThreadingAppDelegate.h"
#import "Event.h"

@implementation ThreadingExamples

- (void)dealloc{
	[managedObjectCreatedOnMainThread release];
	[super dealloc];
}

- (id)init{
	if (self == [super init]) {
		//workerMethodSelector = @selector(doHeavyLoopWithPool);
		//workerMethodSelector = @selector(attemptAssociateAccrossThreads);
		//workerMethodSelector = @selector(attemptAssociateAcrossContext);
		workerMethodSelector = @selector(attemptAssociateAccrossThreadsSafely);

		MultiThreadingAppDelegate *appDelegate = (MultiThreadingAppDelegate *)[[UIApplication sharedApplication] delegate];
		managedObjectContext = [appDelegate managedObjectContext];
		managedObjectCreatedOnMainThread = (Event *)[[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:managedObjectContext] retain];
		NSError *error = nil;
		if (![managedObjectContext save:&error]){
			NSLog(@"%@", [error localizedDescription]);
		}
	}
	return self;
}

#pragma mark -
#pragma mark CoreData Notifications

- (void)subscribeMainContextToCoreDataChangeNotifications:(NSManagedObjectContext *)changingContext{
	// subscribe to the did save notifications
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contextObjectsDidSave:) name:NSManagedObjectContextDidSaveNotification object:changingContext];
}

- (void)contextObjectsDidSave:(NSNotification *)saveNotification{
	MultiThreadingAppDelegate *appDelegate = (MultiThreadingAppDelegate *)[[UIApplication sharedApplication] delegate];
	// get the context set up on app launch, so, on the main thread
	NSManagedObjectContext *mainContext = [appDelegate managedObjectContext];
	// perform the merge on the thread where the "merge to" context was created
	[mainContext performSelectorOnMainThread:@selector(mergeChangesFromContextDidSaveNotification:) withObject:saveNotification waitUntilDone:NO];
	
}


#pragma mark Worker Methods 
- (void)attemptAssociateAcrossContext{
	
	MultiThreadingAppDelegate *appDelegate = (MultiThreadingAppDelegate *)[[UIApplication sharedApplication] delegate];
	// use same persistent store
	NSPersistentStoreCoordinator *coordinator = [appDelegate persistentStoreCoordinator];
	// create new managed object context
	NSManagedObjectContext *newManagedObjectContext = [[NSManagedObjectContext alloc] init];
	// associate the store
	[newManagedObjectContext setPersistentStoreCoordinator:coordinator];
	// register for save notifications from the main context
	//[[NSNotificationCenter defaultCenter] addObserver:managedObjectContext selector:@selector(contextDidChange:) name:NSManagedObjectContextDidSaveNotification object:newManagedObjectContext];
	
	// create the instance in the new context
	Event *newInstance = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:newManagedObjectContext];
	[managedObjectCreatedOnMainThread addChildEventsObject:newInstance];
	NSError *error = nil;
	if (![managedObjectContext save:&error]){
		NSLog(@"%@", [error localizedDescription]);
	}
}

- (NSManagedObjectContext *)isolatedContext{
	NSManagedObjectContext *newManagedObjectContext = [[NSManagedObjectContext alloc] init];
	
	MultiThreadingAppDelegate *appDelegate = (MultiThreadingAppDelegate *)[[UIApplication sharedApplication] delegate];
	// get the persistent store coordinator from shared app
	NSPersistentStoreCoordinator *sharedStoreCoord = [appDelegate persistentStoreCoordinator];
	[newManagedObjectContext setPersistentStoreCoordinator:sharedStoreCoord];

	return [newManagedObjectContext autorelease];
}

- (void)attemptAssociateAccrossThreads{
	// create new event
	Event *newInstance = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:managedObjectContext];
	[managedObjectCreatedOnMainThread addChildEventsObject:newInstance];
	NSError *error = nil;
	if (![managedObjectContext save:&error]){
		NSLog(@"%@", [error localizedDescription]);
	}
}

- (void)attemptAssociateAccrossThreadsSafely{
	NSManagedObjectContext *isolatedMOContext = [self isolatedContext];
	// create new event
	Event *newInstance = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:isolatedMOContext];
	//wire for changes
	[self subscribeMainContextToCoreDataChangeNotifications:isolatedMOContext];
	// get the parent using object id from this context (must not be a new entity)
	Event *parentEvent = (Event *)[isolatedMOContext objectWithID:[managedObjectCreatedOnMainThread objectID]];
	// associate objects from same context
	[newInstance setParentEvent:parentEvent];
	
	NSError *error = nil;
	if (![isolatedMOContext save:&error]){
		NSLog(@"%@", [error localizedDescription]);
	}
}

- (void)doHeavyLoop{
	for (int idx = 0; idx < 10000000; idx++) {
		// alloc a string
		NSString *string = [NSString stringWithFormat:@"Inside Loop on count %i", idx];
	}
}

- (void)doHeavyLoopWithPool{
	NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];
	[self doHeavyLoop];
	[autoreleasePool drain];
	//[autoreleasePool release];
}

#pragma mark -
#pragma mark Thread Invocation Methods

- (void)executeOnMainThread{
	[self performSelector:workerMethodSelector];
}

- (void)executeUsingNSThread{

	NSThread* myThread = [[NSThread alloc] initWithTarget:self

												 selector:workerMethodSelector // <<< reference to ivar selector rather than @selector(myThreadMainMethod)
						  
												   object:nil];
	
	[myThread start];  // Actually spawn the thread
}

- (void)executeSyncUsingPerformInBackground{
	[self performSelectorInBackground:workerMethodSelector withObject:nil];
}


- (void)executeUsingNSOperation{
	NSOperationQueue *queue = [NSOperationQueue new];
	
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
																			selector:workerMethodSelector
																			  object:nil];
	
	[queue addOperation:operation];
	[operation release];
}


@end
