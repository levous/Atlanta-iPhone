//
//  RemoteMessage.m
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "RemoteMessage.h"
#import "JSON.h"
#import "MessagePerson.h"

@implementation RemoteMessage
-(void) deserializeJson: (NSString *)jsonString{
	NSDictionary *jsonData = [jsonString JSONValue];
	NSArray *messages = [jsonData objectForKey:@"Message"];
	NSDictionary *jsonPerson = [messages objectAtIndex:0];
	
	MessagePerson *person = [[MessagePerson alloc] initWithName:[jsonPerson objectForKey:@"Name"] andNumber:[jsonPerson objectForKey:@"Number"]];
	
}

-(NSString *) serializeAsJson{
	return [self JSONRepresentation];
}

@end
