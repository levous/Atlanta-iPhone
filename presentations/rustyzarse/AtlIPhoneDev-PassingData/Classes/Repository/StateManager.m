//
//  StateManager.m
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "StateManager.h"
#import "Lead.h"


@implementation StateManager
@synthesize currentLead;

- (void) saveLead{
	//[[DB saveToTable
}
static StateManager *sharedInstance;

+ (StateManager *) getSingleton{
	if( !sharedInstance || sharedInstance == nil ){
		sharedInstance = [[StateManager alloc] init];
	}
	return sharedInstance;
}

+ (void) releaseSingleton{
	if( !sharedInstance || sharedInstance == nil ){
		[sharedInstance release];
	}
}



@end
