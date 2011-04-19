//
//  CatWithSynthesizers.h
//  Objective C Basics
//
//  Created by Rusty Zarse on 2/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CatWithSynthesizers : UITableViewCell {
  NSString *furColor;
}

@property(retain, nonatomic) NSString *furColor;
@property(assign, nonatomic) id lunch;
@property(readonly) NSUInteger remainingLivesCount;

@end
