//
//  ThreadInvocationViewController.m
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "ThreadInvocationViewController.h"
#import "ThreadingExamples.h"

@implementation ThreadInvocationViewController

@synthesize scrollView;

- (void)dealloc {
	[threadingExamples release];
    [super dealloc];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	threadingExamples = [[ThreadingExamples alloc] init];
	[scrollView setContentSize:CGSizeMake([[self view] bounds].size.width, 1000)];
}


#pragma mark -
#pragma mark Button Handlers


- (IBAction)mainThreadInvokePressed{
	[threadingExamples executeOnMainThread];
}

- (IBAction)nsThreadInvokePressed{
	[threadingExamples executeUsingNSThread];
}

- (IBAction)performInBackgroundInvokePressed{
	[threadingExamples executeSyncUsingPerformInBackground];
}

- (IBAction)nsOperationInvokePressed{
	[threadingExamples executeUsingNSOperation];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
