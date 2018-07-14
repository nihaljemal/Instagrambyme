//
//  PostViewCell.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>


@interface PostViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postedPicture;
@property (weak, nonatomic) IBOutlet UILabel *postNameTag;
-(void)configureCell:(Post *)post;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) NSString* identity;


@end
