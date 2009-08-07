//
//  ReceiverViewController.h
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Lead;

@interface ReceiverViewController : UIViewController {
	Lead *lead;
}

@property (retain,nonatomic) Lead *lead;

@end
