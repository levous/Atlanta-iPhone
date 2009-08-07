//
//  MessagePerson.m
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "MessagePerson.h"


@implementation MessagePerson
@synthesize name;
-(id) initWithName: (NSString *)in_name andNumber: (NSString *) in_number{
	if([self init]){
		name = in_name;
		number = in_number;
	}
	return self;
}
@end
