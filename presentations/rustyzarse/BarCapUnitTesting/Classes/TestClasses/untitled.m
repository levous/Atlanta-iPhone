//
//  untitled.m
//  BarCapUnitTesting
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//



/*
 STAssertNoErr(a1, description, ...) 
 STAssertErr(a1, a2, description, ...) 
 STAssertNotNULL(a1, description, ...) 
 STAssertNULL(a1, description, ...) 
 STAssertNotEquals(a1, a2, description, ...) 
 STAssertNotEqualObjects(a1, a2, desc, ...) 
 STAssertOperation(a1, a2, op, description, ...)
 STAssertGreaterThan(a1, a2, description, ...)
 STAssertLessThan(a1, a2, description, ...)
 STAssertLessThanOrEqual(a1, a2, description, ...)
 STAssertEqualStrings(a1, a2, description, ...) 
 STAssertNotEqualStrings(a1, a2, description, ...)
 STAssertEqualCStrings(a1, a2, description, ...) 
 STAssertNotEqualCStrings(a1, a2, description, ...)
 STAssertEqualObjects(a1, a2, description, ...) 
 STAssertEquals(a1, a2, description, ...)
 STAssertEqualsWithAccuracy(a1, a2, accuracy, description, ...)
 STAssertTrueNoThrow(expr, description, ...)
 STAssertFalseNoThrow(expr, description, ...)
 STAssertThrows(expr, description, ...)
 STAssertThrowsSpecific(expr, specificException, description, ...)
 STAssertThrowsSpecificNamed(expr, specificException, aName, description, ...)
 STAssertNoThrow(expr, description, ...)
 STAssertNoThrowSpecific(expr, specificException, description, ...)
 STAssertNoThrowSpecificNamed(expr, specificException, aName, description, ...)
 */



#import "untitled.h"


@implementation untitled
-( void) testFrogStomp{
	Frog *frog = [Frog new];
	NSString *sound = [frog stomp];
	STAssertEqualStrings(@"ribbit", sound, @"I EXPECTED A Ribbit before the frog croaked" ) ;
	
}
@end
