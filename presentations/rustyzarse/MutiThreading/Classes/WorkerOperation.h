//
//  WorkerOperation.h
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//



@interface WorkerOperation : NSOperation {

}
@property (retain, nonatomic) NSArray *someList;
@property (retain, nonatomic) NSDictionary *someLookup;
@property (copy, nonatomic) NSString *someString;
@end
