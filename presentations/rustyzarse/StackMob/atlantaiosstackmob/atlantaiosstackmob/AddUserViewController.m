//
//  AddUserViewController.m
//  AtlantaIOSStackMob
//
//  Created by Rusty Zarse on 11/15/11.
//  Copyright (c) 2011 LeVous, LLC. All rights reserved.
//

#import "AddUserViewController.h"
#import "LeVousAppDelegate.h"

@implementation AddUserViewController
@synthesize username;
@synthesize password;
@synthesize twitterHandle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPassword:nil];
    [self setTwitterHandle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [username release];
    [password release];
    [twitterHandle release];
    [super dealloc];
}
- (IBAction)savePressed:(id)sender {
    
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [(LeVousAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:[[self username] text] forKey:@"username"];
    [newManagedObject setValue:[[self password] text] forKey:@"password"];
    [newManagedObject setValue:[[self twitterHandle] text] forKey:@"twitterHandle"];

    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
}
@end
