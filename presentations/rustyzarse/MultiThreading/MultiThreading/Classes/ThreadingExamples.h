//
//  ThreadingExamples.h
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;

@interface ThreadingExamples : NSObject {
	SEL workerMethodSelector;
	NSManagedObjectContext *managedObjectContext;
	Event *managedObjectCreatedOnMainThread;
}
- (void)executeOnMainThread;
- (void)executeUsingNSThread;
- (void)executeSyncUsingPerformInBackground;
- (void)executeUsingNSOperation;

@end
