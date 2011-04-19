//
//  Event.h
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Event :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSManagedObject * parentEvent;
@property (nonatomic, retain) NSSet* childEvents;

@end


@interface Event (CoreDataGeneratedAccessors)
- (void)addChildEventsObject:(NSManagedObject *)value;
- (void)removeChildEventsObject:(NSManagedObject *)value;
- (void)addChildEvents:(NSSet *)value;
- (void)removeChildEvents:(NSSet *)value;

@end

