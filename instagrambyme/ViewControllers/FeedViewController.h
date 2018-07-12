//
//  FeedViewController.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/10/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController

@property (strong, nonatomic) UIImage* justTaken;
@property (strong, nonatomic) NSString* blah;

-(void)logoutProcess;
+ (BOOL)isSourceTypeAvailable: (UIImagePickerControllerSourceType)sourceType;
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;

@end
