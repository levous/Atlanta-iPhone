//
//  RootViewController.h
//  MultiThreading
//
//  Created by Rusty Zarse on 4/19/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {

}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
