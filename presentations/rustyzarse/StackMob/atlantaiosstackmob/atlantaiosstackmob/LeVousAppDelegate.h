//
//  LeVousAppDelegate.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/14/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreDataManager;

@interface LeVousAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) CoreDataManager *appCoreDataManager;

- (void)saveContext;

@end
