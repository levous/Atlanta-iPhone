//
//  AtlantaBarCampJsonAppDelegate.m
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright Phone Owner 2009. All rights reserved.
//

#import "AtlantaBarCampJsonAppDelegate.h"

@implementation AtlantaBarCampJsonAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
