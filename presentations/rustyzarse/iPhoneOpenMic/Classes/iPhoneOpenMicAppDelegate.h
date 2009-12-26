//
//  iPhoneOpenMicAppDelegate.h
//  iPhoneOpenMic
//
//  Created by Larry Brambrut on 12/15/09.
//  Copyright L.R. Brambrut LLC 2009. All rights reserved.
//

@interface iPhoneOpenMicAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

