//
//  FeedViewController.m
//  instagrambyme
//
//  Created by Nihal Riyadh Jemal on 7/10/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "FeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "PostViewCell.h"
#import "ComposeViewController.h"
#import "DetailsViewController.h"

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* posts;
@property UIRefreshControl * refreshControl;


@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
  self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(datarequest) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    
    [self datarequest];
    
    
    
}

-(void)datarequest{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"_created_at"];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            NSLog(@"done");
            self.posts = posts;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//**********************************************TABLEVIEW************************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
};


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *post = self.posts[indexPath.row];
    PostViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostViewCell" forIndexPath:indexPath];
    [cell configureCell:post];
    return cell;
};

//*************************************************CAMERA*************************************************
- (IBAction)takePictureButton:(id)sender {
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
}
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.justTaken = info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    [self dismissViewControllerAnimated:YES completion:^{
         [self performSegueWithIdentifier:@"seconedSegue" sender:nil];
    }];
   
}

//*****************************************LOGGING OUT**************************************************
-(void)logoutProcess{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
            // PFUser.current() will now be nil
    }];
}


- (IBAction)logoutButton:(id)sender {
    [self logoutProcess];

}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
                                                [self datarequest];
                                                [self.tableView reloadData];
                                                [refreshControl endRefreshing];
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     UINavigationController* navigationController = [segue destinationViewController];
     
    if([segue.identifier isEqualToString:@"detailsSegue"]){
        
    UITableViewCell *tappedCell = sender;
    NSIndexPath *tappedIndexPath = [self.tableView indexPathForCell:tappedCell];
    Post *post = self.posts[tappedIndexPath.row];
   
    DetailsViewController *detailVC = [segue destinationViewController];
        detailVC.post = post;

     }
     else if([segue.identifier  isEqualToString:@"seconedSegue"]){
     ComposeViewController* composeVC = (ComposeViewController*) navigationController.topViewController;
     composeVC.image = self.justTaken;
         
     }

     
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 

//    Post *post = [Post object];
//    post.userID = @"Hello";
//    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        NSLog(@"saved");
//    }];
//
//PFQuery *querry = [Post query];
//[querry findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//    NSLog(@"done");
//}];

@end
