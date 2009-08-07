//
//  RootViewController.m
//  AtlIPhoneDev-PassingData
//
//  Created by Rusty Zarse on 7/10/09.
//  Copyright 2009 Phone Owner. All rights reserved.
//

#import "RootViewController.h"
#import "ReceiverViewController.h"
#import "StateManager.h"
#import "Giraffe.h"

@implementation RootViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

-(void)submitClicked:(id)sender
{
	Giraffe *giraffe = [Giraffe new];
	[giraffe setNameFirst:[textFieldName text]];
	
	StateManager *stateManger = [StateManager getSingleton];
	[stateManger setCurrentLead:(Lead *)giraffe];
	
	ReceiverViewController *receiverController = [[ReceiverViewController alloc] init];
	[[self navigationController] pushViewController:receiverController animated:YES];
	[receiverController release];
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect appFrame = [[UIScreen mainScreen] bounds];
	// create parent content view
	UIView *contentView = [[UIView alloc] initWithFrame:appFrame];
	
	// create text field entry box
	textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, appFrame.size.width - 20, 30 )];
	[textFieldName setText:@"Hello Atlanta"];
	
	// create button to submit
	UIButton *buttonSubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[buttonSubmit setFrame:CGRectMake(10, 50, appFrame.size.width - 20, 100 )];
	[buttonSubmit setTitle:@"Do it" forState:UIControlStateNormal];

	// set self as handler of button
	[buttonSubmit addTarget:self action:@selector(submitClicked:) forControlEvents:UIControlEventTouchUpInside];
	// add to the parent view
	[contentView addSubview:textFieldName];
	
	[contentView addSubview:buttonSubmit];
	
	[self setView:contentView];
	[contentView release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
	[textFieldName release];
    [super dealloc];
}


@end
