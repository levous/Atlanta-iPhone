//
//  LVExternalDisplayManager.h
//
//  Created by Warren Moore on 12/9/10.
//

#import <Foundation/Foundation.h>

@interface LVExternalDisplayManager : NSObject<UIAlertViewDelegate> {
	CADisplayLink *screenRefreshTimer;
	UIImageView   *mirrorImageView;
}

+ (LVExternalDisplayManager *)sharedInstance;

@property (nonatomic, retain) UIWindow *mainScreenWindow;
@property (nonatomic, retain) UIWindow *externalWindow;
@property (nonatomic, retain) UIScreen *externalScreen;
@property (nonatomic, retain) NSArray  *availableScreenModes;

- (void)detectExternalDisplays;

@end
