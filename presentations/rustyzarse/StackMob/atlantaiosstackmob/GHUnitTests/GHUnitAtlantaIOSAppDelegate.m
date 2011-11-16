//
//  GHUnitAtlantaIOSAppDelegate.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/16/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "GHUnitAtlantaIOSAppDelegate.h"

@implementation GHUnitAtlantaIOSAppDelegate
@synthesize appCoreDataManager;

- (void)dealloc
{
    [appCoreDataManager release];

    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        appCoreDataManager = [[CoreDataManager alloc] init];
        
    }
    return self;
}

@end
