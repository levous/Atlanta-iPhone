//
//  BarCapUnitTestingAppDelegate.m
//  BarCapUnitTesting
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright Phone Owner 2009. All rights reserved.
//

#import "BarCapUnitTestingAppDelegate.h"

@implementation BarCapUnitTestingAppDelegate

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
