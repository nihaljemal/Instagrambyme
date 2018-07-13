//
//  ComposeViewController.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/10/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *chosenPicture;
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionView;

@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSString* userNameLabel;
//@property (strong, nonatomic) NSString* descriptionobject;

@end
