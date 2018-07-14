//
//  DetailsViewController.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/12/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "DetailsViewController.h"
#import "parse.h"
#import "Post.h"
#import <UIKit/UIKit.h>

@interface DetailsViewController ()



@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self datarequest1];
    [self datarequest2];
    
}
-(void)datarequest2{
   // PFUser *user = [PFUser currentUser];
    
   // NSString *name = user[@"username"];
    //self.detailUsername.text = name;
    
    self.detailDescription.text = self.post.caption;
    
    NSDate* clock = self.post.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
   
    NSString *stringFromDate = [formatter stringFromDate:clock];
    
    self.detailTimestamp.text = stringFromDate;
    self.detailUsername.text = PFUser.currentUser.username;
    
    self.detailPicture.image = nil;
    self.detailPicture.file = self.post.image;
    [self.detailPicture loadInBackground];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)backTap:(id)sender {
//    [self dismissViewControllerAnimated:NO completion:nil];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
