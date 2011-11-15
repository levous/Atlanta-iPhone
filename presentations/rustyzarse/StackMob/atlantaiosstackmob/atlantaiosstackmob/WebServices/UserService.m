//
//  UserService.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "UserService.h"

@implementation UserService

@synthesize delegate;

- (id)initWithDelegate:(id)aDelegate{
    self = [self init];
   
    if(self){
        delegate = aDelegate;
    }
    
    return self;
}

- (void)getAllUsers{
    
    // call the stackmob restful service
    [[StackMob stackmob] get:@"user" 
               withArguments:[NSDictionary dictionary] 
                 andCallback:^(BOOL success, id result)
    {
        if(success){
            NSArray *users = (NSArray *)result;
            if( [delegate respondsToSelector:@selector(successWithData:)] ){
                [delegate performSelector:@selector(successWithData:) withObject:users];
            }
        }
        else{
            
            NSError *error = (NSError *)result;
            NSLog(@"Stackmob Error: %@", [error localizedDescription]);
            
            if( [delegate respondsToSelector:@selector(failureWithError:)] ){
                [delegate performSelector:@selector(failureWithError:) withObject:error];
            }
        }
    }];
    
}

@end
