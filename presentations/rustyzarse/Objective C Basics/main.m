//
//  main.m
//  Objective C Basics
//
//  Created by Rusty Zarse on 2/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
