//
//  UserLoginViewController.m
//  csi_las4
//
//  Created by Supasit on 6/3/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "UserLoginViewController.h"
#import "PinLoginViewController.h"
#import "SimpleTableCell.h"

@interface UserLoginViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation UserLoginViewController
@synthesize txt_user;
@synthesize txt_password;
@synthesize nvb_title;
@synthesize userTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_UserLogin.png"]];
    
    nvb_title.topItem.title=@"Select User";
    [self.userTable delegate];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)btn_login:(id)sender {
    UIStoryboard *storyBaordId=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PinLoginViewController *nextView=(PinLoginViewController*)[storyBaordId instantiateViewControllerWithIdentifier:@"PinLoginViewController"];
    [self performSegueWithIdentifier:@"LoginToPinSeque" sender:nextView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 38;
}














-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
}



@end
