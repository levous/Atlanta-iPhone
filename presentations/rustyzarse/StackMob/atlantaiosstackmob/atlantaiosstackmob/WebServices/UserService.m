//
//  UserService.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "UserService.h"
@interface UserService()
- (void)handleFailure:(NSError *)error;
@end

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
            [self handleFailure:result];
        }
    }];
    
}

- (void)postNewUsers:(NSArray *)usersArray{
    for (NSDictionary *userDict in usersArray){    // call the stackmob restful service
        [[StackMob stackmob] post:@"user"
                    withArguments:userDict 
                      andCallback:^(BOOL success, id result)
         {
             if(success){
                 NSDictionary *userResult = (NSDictionary *)result;
                 if( [delegate respondsToSelector:@selector(successWithData:)] ){
                     [delegate performSelector:@selector(successWithData:) withObject:userResult];
                 }
             }
             else{
                 [self handleFailure:result];
                
             }
         }];
    }
}

- (void)handleFailure:(NSError *)error{

    NSLog(@"Stackmob Error: %@", [error localizedDescription]);
    
    if( [delegate respondsToSelector:@selector(failureWithError:)] ){
        [delegate performSelector:@selector(failureWithError:) withObject:error];
    }
}

@end
