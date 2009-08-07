//
//  RemoteMessage.h
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessagePerson;

@interface RemoteMessage : NSObject {
	NSArray *messages;
}

@property(retain,nonatomic) NSArray *messages;

-(void) deserializeJson: (NSString *)jsonString;
@end
