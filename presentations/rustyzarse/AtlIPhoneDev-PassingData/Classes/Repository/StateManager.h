//
//  StateManager.h
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Lead;

@interface StateManager : NSObject {
	Lead *currentLead;
}

@property (retain, nonatomic) Lead *currentLead;

+(StateManager *) getSingleton;

@end
