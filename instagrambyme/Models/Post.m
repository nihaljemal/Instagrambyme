//
//  Post.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/9/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "Post.h"
#import <Parse/Parse.h>

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
//@dynamic description;
@dynamic image;
@dynamic description;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

//setting newpost parameter
+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )description withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];                         //What is happening here
    [newPost saveInBackgroundWithBlock: completion];
    newPost.description = description;
}

//getting file from image
+ (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    // check if image is not nil
    if (!image) {
        return nil;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    return [PFFile fileWithName:@"image.png" data:imageData];
}


@end
