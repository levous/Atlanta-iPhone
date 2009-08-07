//
//  AtlIPhoneDev_PassingDataAppDelegate.m
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright Phone Owner 2009. All rights reserved.
//

#import "AtlIPhoneDev_PassingDataAppDelegate.h"
#import "RootViewController.h"

@implementation AtlIPhoneDev_PassingDataAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	RootViewController *rootViewController = [[RootViewController alloc] init];
	navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	[rootViewController release];
	[window addSubview:[navController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[navController release];
    [window release];
    [super dealloc];
}


@end
