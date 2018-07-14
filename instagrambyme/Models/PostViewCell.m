//
//  PostViewCell.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "PostViewCell.h"
#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"

@implementation PostViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

//Cell configuration at tableview loading
-(void)configureCell:(Post *)post{
    self.postedPicture.image = nil;
    self.postedPicture.file = post.image;
    [self.postedPicture loadInBackground];
    self.descriptionLabel.text = post[@"caption"];
    PFUser *user = [PFUser currentUser];
    NSString *name = user[@"username"];
    self.postNameTag.text = name;
    self.identity = post[@"_id"];
}
@end
