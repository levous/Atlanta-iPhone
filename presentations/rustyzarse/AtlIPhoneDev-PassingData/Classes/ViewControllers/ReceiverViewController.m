//
//  ReceiverViewController.m
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "ReceiverViewController.h"
#import "Lead.h"
#import "StateManager.h"

@implementation ReceiverViewController
@synthesize lead;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	StateManager *stateMgr = [StateManager getSingleton];
	lead = [stateMgr currentLead];

	
	CGRect appFrame = [[UIScreen mainScreen] bounds];
	// create parent content view
	UIView *contentView = [[UIView alloc] initWithFrame:appFrame];
	
	// create text field entry box
	UITextField *textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, appFrame.size.width - 20, 30 )];
	[textFieldName setText:[lead nameFirst]];
	[contentView addSubview:textFieldName];
	[textFieldName release];
	
	[self setView:contentView];
	[contentView release];	
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
