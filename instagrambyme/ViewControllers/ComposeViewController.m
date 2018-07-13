//
//  ComposeViewController.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/10/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "FeedViewController.h"


@interface ComposeViewController ()

@property (nonatomic, strong) PFObject *post;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chosenPicture.image = self.image;
    PFUser *user = [PFUser currentUser];
    NSString *name = user[@"username"];
    self.userIDLabel.text = name;
    
    
    
//    [query getObjectInBackgroundWithId:@"username" block:^(PFObject *user, NSError *error) {
//    NSString *name = user[@"username"];
//    self.userIDLabel.text = name;
//    }];
    //[query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
   // }];
   
    
    //self.userIDLabel.text =
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)descriptionField:(id)sender {
    //move screen up so user can see what they are typing
}

- (IBAction)postButtonReal:(id)sender {
     //post to parse here by calling postuser image method
    [Post postUserImage:self.image withCaption:self.descriptionView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"uploaded");
    }];
    [self dismissViewControllerAnimated:NO completion:nil];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
