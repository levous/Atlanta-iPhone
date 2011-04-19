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
		workerMethodSelector = @selector(doHeavyLoopWithPool);
		//workerMethodSelector = @selector(attemptAssociateAccrossThreads);
		//workerMethodSelector = @selector(attemptAssociateAccrossContext);
		
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

#pragma mark Worker Methods 
- (void)attemptAssociateAccrossContext{
	
	
	MultiThreadingAppDelegate *appDelegate = (MultiThreadingAppDelegate *)[[UIApplication sharedApplication] delegate];
	// use same persistent store
	NSPersistentStoreCoordinator *coordinator = [appDelegate persistentStoreCoordinator];
	// create new managed object context
	NSManagedObjectContext *newManagedObjectContext = [[NSManagedObjectContext alloc] init];
	// associate the store
	[newManagedObjectContext setPersistentStoreCoordinator:coordinator];
	// register for save notifications from the main context
	[[NSNotificationCenter defaultCenter] addObserver:managedObjectContext selector:@selector(contextDidChange:) name:NSManagedObjectContextDidSaveNotification object:newManagedObjectContext];
	
	// create the instance in the new context
	Event *newInstance = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:newManagedObjectContext];
	[managedObjectCreatedOnMainThread addChildEventsObject:newInstance];
	NSError *error = nil;
	if (![managedObjectContext save:&error]){
		NSLog(@"%@", [error localizedDescription]);
	}
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
