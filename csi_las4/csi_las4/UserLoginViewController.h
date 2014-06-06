//
//  UserLoginViewController.h
//  csi_las4
//
//  Created by Supasit on 6/3/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txt_user;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)btn_login:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *nvb_title;

@property (weak, nonatomic) IBOutlet UITableView *userTable;




@end
