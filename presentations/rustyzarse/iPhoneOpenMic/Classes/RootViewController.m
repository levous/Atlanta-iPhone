//
//  RootViewController.m
//  iPhoneOpenMic
//
//  Created by Larry Brambrut on 12/15/09.
//  Copyright L.R. Brambrut LLC 2009. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController
@synthesize imageView;
/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */
-(IBAction) choosePhotoPressed: (id)sender{
	// have camera, let's take a pic
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	[imagePicker setDelegate:self];
	[self presentModalViewController:imagePicker animated:YES];
	
	[imagePicker release];
}

-(IBAction) takeCameraPicturePressed: (id)sender{
	NSLog( @"checking for camera" );
	if( ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) return;

	// have camera, let's take a pic
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	[imagePicker setDelegate:self];
	[imagePicker takePicture];
	[imagePicker release];

}
-(IBAction) takeScreenShotPressed: (id)sender{}
-(IBAction) startBonjourPressed: (id)sender{}


#pragma mark UIImageControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	// on the phone, we shoulde resize this
	[imageView setContentMode:UIViewContentModeScaleToFill];
	[imageView setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
	[self dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[imageView release];
    [super dealloc];
}


@end

