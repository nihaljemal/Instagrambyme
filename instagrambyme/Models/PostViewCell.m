//
//  PostViewCell.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "PostViewCell.h"
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

-(void)configureCell:(Post *)post{
    
}

@end
