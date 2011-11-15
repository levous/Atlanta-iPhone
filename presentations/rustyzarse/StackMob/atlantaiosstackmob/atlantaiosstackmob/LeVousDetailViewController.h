//
//  LeVousDetailViewController.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/14/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeVousDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (retain, nonatomic) IBOutlet UILabel *username;

@property (retain, nonatomic) IBOutlet UILabel *twitterHandle;

@property (retain, nonatomic) IBOutlet UITableView *publishedAppsTableView;

@end
