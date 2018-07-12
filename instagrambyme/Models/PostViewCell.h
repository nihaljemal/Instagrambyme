//
//  PostViewCell.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postedPicture;
@property (weak, nonatomic) IBOutlet UILabel *postNameTag;
-(void)configureCell:(Post *)post;

@end
