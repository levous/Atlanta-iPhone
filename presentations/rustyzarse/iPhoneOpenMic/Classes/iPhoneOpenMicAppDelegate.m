//
//  iPhoneOpenMicAppDelegate.m
//  iPhoneOpenMic
//
//  Created by Larry Brambrut on 12/15/09.
//  Copyright L.R. Brambrut LLC 2009. All rights reserved.
//

#import "iPhoneOpenMicAppDelegate.h"
#import "RootViewController.h"


@implementation iPhoneOpenMicAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

