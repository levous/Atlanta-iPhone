//
//  ThreadInvocationViewController.h
//  MutiThreading
//
//  Created by Rusty Zarse on 3/15/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThreadingExamples;

@interface ThreadInvocationViewController : UIViewController {
	ThreadingExamples *threadingExamples;
}
- (IBAction)mainThreadInvokePressed;
- (IBAction)nsThreadInvokePressed;
- (IBAction)performInBackgroundInvokePressed;
- (IBAction)nsOperationInvokePressed;

@property(retain,nonatomic) IBOutlet UIScrollView *scrollView;
@end
