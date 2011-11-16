//
//  AddUserViewController.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUserViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (retain, nonatomic) IBOutlet UITextField *twitterHandle;
- (IBAction)savePressed:(id)sender;
@end
