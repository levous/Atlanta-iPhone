//
//  AtlIPhoneDev_PassingDataAppDelegate.h
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright Phone Owner 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AtlIPhoneDev_PassingDataAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

