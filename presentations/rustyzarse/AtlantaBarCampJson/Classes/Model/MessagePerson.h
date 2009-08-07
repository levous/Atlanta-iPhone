//
//  MessagePerson.h
//  AtlantaBarCampJson
//
//  Created by Rusty Zarse on 7/18/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MessagePerson : NSObject {
	NSString *name;
	NSString *number;
}

@property (retain, nonatomic) NSString *name;
-(id) initWithName: (NSString *)in_name andNumber: (NSString *) in_number;
@end
