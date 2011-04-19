//
//  CatWithSynthesizers.m
//  Objective C Basics
//
//  Created by Rusty Zarse on 2/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "CatWithSynthesizers.h"


@implementation CatWithSynthesizers

@synthesize lunch, remainingLivesCount;

- (void)setFurColor:(NSString *)newFurColor{
  
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
