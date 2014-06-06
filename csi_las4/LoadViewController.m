//
//  LoadViewController.m
//  csi_las4
//
//  Created by Supasit on 6/3/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "LoadViewController.h"
#import "UserLoginViewController.h"

#import "ConnectObject.h"


@interface LoadViewController ()

@end

@implementation LoadViewController
@synthesize lab_message;
@synthesize lab_messageDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
    ConnectObject *conn=[[ConnectObject alloc]init];
    if ([conn connection]) {
        lab_message.text=@"OK";
        [self Go];
    }else lab_message.text=@"can't connect";

    
}

-(void)Go{
    
    
    UIStoryboard *storyBaordId=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserLoginViewController *nextView=(UserLoginViewController*)[storyBaordId instantiateViewControllerWithIdentifier:@"UserLoginViewControllerID"];
    [self performSegueWithIdentifier:@"UserLoginSeque" sender:nextView];

    
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
