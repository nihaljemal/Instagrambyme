//
//  DetailsViewController.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/12/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet PFImageView *detailPicture;

@property (weak, nonatomic) IBOutlet UILabel *detailUsername;
@property (weak, nonatomic) IBOutlet UILabel *detailDescription;
@property (weak, nonatomic) IBOutlet UILabel *detailTimestamp;

@property (strong, nonatomic) NSString* ddescription;
@property (strong, nonatomic) Post* post;

-(void)datarequest2;

@end
