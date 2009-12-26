//
//  RootViewController.h
//  iPhoneOpenMic
//
//  Created by Larry Brambrut on 12/15/09.
//  Copyright L.R. Brambrut LLC 2009. All rights reserved.
//

@interface RootViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
	IBOutlet UIImageView *imageView;
}

@property(retain,nonatomic) IBOutlet UIImageView *imageView;
-(IBAction) choosePhotoPressed: (id)sender;
-(IBAction) takeCameraPicturePressed: (id)sender;
-(IBAction) takeScreenShotPressed: (id)sender;
-(IBAction) startBonjourPressed: (id)sender;
@end
