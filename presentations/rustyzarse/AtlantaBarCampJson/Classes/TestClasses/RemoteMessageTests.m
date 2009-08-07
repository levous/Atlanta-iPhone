//
//  RemoteMessageTests.m
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "RemoteMessageTests.h"
#import "RemoteMessage.h"
#import "MessagePerson.h"
#import "JSON.h"

@implementation RemoteMessageTests
- (void) testParseJson{
	NSString *jsonSample = @"{\"Message\":[{\"Name\":\"Fred Flintstone\",\"Number\":\"800-555-1212\"},{\"Name\":\"Barney Rubble\",\"Number\":\"800-555-1515\"}]}";
	RemoteMessage *remoteMsg = [[RemoteMessage alloc] init];
	[remoteMsg deserializeJson:jsonSample];
	
}

- (void) testGenJson{
	
	MessagePerson *erson = [[MessagePerson alloc] initWithName:@"my name"	andNumber:@"3434"];
	NSString *jsonVal = [erson	JSONFragment];
	
}

@end
