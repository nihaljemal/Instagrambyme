//
//  Post.h
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse.h"

@interface Post : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString *caption;

@property (nonatomic, strong) PFFile *image;
//@property (nonatomic, strong) NSString* clock;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;
- (UIImage * _Nullable)resizeImage:(UIImage * _Nullable)image withSize:(CGSize)size;

@end

