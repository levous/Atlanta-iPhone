//
//  LVExternalDisplayManager.m
//
//  Created by Warren Moore on 12/9/10.
//

#import "LVExternalDisplayManager.h"

#define kExternalDisplayScreenIndex        1
#define kExternalDisplayRefreshInterval    0.2

static LVExternalDisplayManager *sharedInstance = nil;


@interface LVExternalDisplayManager (Internal)
- (void)registerForNotifications;
- (void)presentScreenResolutionDialog;
@end

@implementation LVExternalDisplayManager
@synthesize mainScreenWindow, externalWindow, externalScreen, availableScreenModes;

+ (LVExternalDisplayManager *)sharedInstance {
	if (sharedInstance == nil)
	{
		sharedInstance = [[LVExternalDisplayManager alloc] init];
	}
	return sharedInstance;
}

+ (UIImage *)imageWithContentsOfView:(UIView *)view;
{
	CGRect       viewRect = [view bounds];
	UIGraphicsBeginImageContext(viewRect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[view.layer renderInContext:context];
	UIImage      *screenImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return screenImage;
}

- (id)init {
	if ((self = [super init]))
	{
		[self registerForNotifications];
		mainScreenWindow = [[[UIApplication sharedApplication] keyWindow] retain];
	}

	return self;
}

- (void)registerForNotifications {
	// Application notifications
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];

	// UIScreen notifications
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(externalScreenWasConnected:) name:UIScreenDidConnectNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(externalScreenWasDisconnected:) name:UIScreenDidDisconnectNotification object:nil];
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {
	if (self.externalWindow)
	{
		screenRefreshTimer = [[NSTimer scheduledTimerWithTimeInterval:kExternalDisplayRefreshInterval
		                       target:self
		                       selector:@selector(refreshMirroredScreenImage:)
		                       userInfo:nil
		                       repeats:YES] retain];
	}
}

- (void)applicationWillResignActive:(NSNotification *)notification {
	[screenRefreshTimer invalidate];
	[screenRefreshTimer release], screenRefreshTimer = nil;
}

- (void)externalScreenWasConnected:(NSNotification *)notification {
	IMLogInfo(@"Detected connection of new external screen");
	[self detectExternalDisplays];
}

- (void)externalScreenWasDisconnected:(NSNotification *)notification {
	IMLogInfo(@"Detected disconnection of external screen");
	[self detectExternalDisplays];
}

- (void)detectExternalDisplays {
	// Configure external display if present
	if (self.externalWindow == nil && [[UIScreen screens] count] > 1)
	{
		self.externalScreen = [[UIScreen screens] objectAtIndex:kExternalDisplayScreenIndex];

		self.availableScreenModes = [self.externalScreen availableModes];
		[self presentScreenResolutionDialog];
	}

	// Teardown external display if it has been disconnected
	if (self.externalWindow != nil && [[UIScreen screens] count] == 1)
	{
		self.externalWindow       = nil;
		self.externalScreen       = nil;
		self.availableScreenModes = nil;
		[screenRefreshTimer invalidate];
		[screenRefreshTimer release], screenRefreshTimer = nil;
	}
}

- (void)configureExternalScreen:(UIScreen *)screen withMode:(UIScreenMode *)mode {
	[screen setCurrentMode:mode];

	CGRect fullScreenFrame = [screen applicationFrame]; // Honor the status bar if it's visible

	self.externalWindow = [[UIWindow alloc] initWithFrame:fullScreenFrame];
	[self.externalWindow setScreen:screen];
	//experiment to place in iphone background
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhone-background.png"]];
	float       left            = (fullScreenFrame.size.width - backgroundView.frame.size.width) / 2;
	[backgroundView setLeft:left];
	[self.externalWindow addSubview:backgroundView];
	[backgroundView release];

	CGRect contentFrame = CGRectMake(left + 36, 146, 320, 460);

	//CGRect contentFrame = fullScreenFrame;
	// For now, the only use of this class is to mirror the screen on the device, so we create a view to display a single image
	mirrorImageView = [[UIImageView alloc] initWithFrame:contentFrame];
	[mirrorImageView setContentMode:UIViewContentModeScaleAspectFit];
	[mirrorImageView setBackgroundColor:[UIColor blackColor]];
	[self.externalWindow addSubview:mirrorImageView];

	[self.externalWindow makeKeyAndVisible];
	[self.mainScreenWindow makeKeyWindow];

	/*screenRefreshTimer = [[NSTimer scheduledTimerWithTimeInterval:kExternalDisplayRefreshInterval
	 *                                                     target:self
	 *                                                   selector:@selector(refreshMirroredScreenImage:)
	 *                                                   userInfo:nil
	 *                                                    repeats:YES] retain];
	 */
	screenRefreshTimer = [[CADisplayLink displayLinkWithTarget:self selector:@selector(refreshMirroredScreenImage:)] retain];
	[screenRefreshTimer setFrameInterval:kExternalDisplayRefreshInterval];
	// We MUST add ourselves in the commons run loop in order to mirror during UITrackingRunLoopMode.
	// Otherwise, the display won't be updated while fingering are touching the screen.
	// This has a major impact on performance though...
	[screenRefreshTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)refreshMirroredScreenImage:(NSTimer *)timer {
	// Render the main screen to an image and present it on the external display
	UIImage *image = [LVExternalDisplayManager imageWithContentsOfView:mainScreenWindow];

	[mirrorImageView setImage:image];
}

- (void)presentScreenResolutionDialog {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"External Display Connected"
	                          message:@"Please choose the resolution of your external display."
	                          delegate:self
	                          cancelButtonTitle:nil
	                          otherButtonTitles:nil];

	for (UIScreenMode *mode in self.availableScreenModes)
	{
		CGSize modeResolution = [mode size];
		[alertView addButtonWithTitle:[NSString stringWithFormat:@"%d × %d", (int)modeResolution.width, (int)modeResolution.height]];
	}

	[alertView show];
	[alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	// We assume there is no Cancel button
	UIScreenMode *screenMode = [self.availableScreenModes objectAtIndex:buttonIndex];

	[self configureExternalScreen:self.externalScreen withMode:screenMode];
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];

	[screenRefreshTimer invalidate];
	[screenRefreshTimer release], screenRefreshTimer = nil;

	[mirrorImageView release], mirrorImageView           = nil;
	[externalWindow release], externalWindow             = nil;
	[externalScreen release], externalScreen             = nil;
	[availableScreenModes release], availableScreenModes = nil;
	[super dealloc];
}

@end
