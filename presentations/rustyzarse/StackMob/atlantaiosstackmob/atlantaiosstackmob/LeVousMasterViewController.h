//
//  LeVousMasterViewController.h
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/14/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeVousDetailViewController;

#import <CoreData/CoreData.h>

@interface LeVousMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) LeVousDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
