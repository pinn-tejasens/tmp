//
//  HomeViewController.m
//  csi_las2
//
//  Created by Supasit on 5/22/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize arrData;
@synthesize lab_time,lab_name;
@synthesize h,m,s;

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
    [self.s setFrame:CGRectMake(0, 0, 300, 25)];
    [self.m setFrame:CGRectMake(0, 0, 300, 25)];
    [self.h setFrame:CGRectMake(0, 0, 300, 25)];
    lab_name.text=(@"its : %@",[arrData valueForKey:@"name"]);
        // [self performSelector:@selector(getTime) withObject:Nil afterDelay:1];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(getTime)
                                   userInfo:nil
                                    repeats:YES];
   

}


-(void)getTime{
    NSDate *currentTime = [NSDate date];
     NSDateFormatter *dateTime = [[NSDateFormatter alloc]init];
    [dateTime setDateFormat:@"HH:mm:ss"];
    NSString *time=[dateTime stringFromDate:currentTime];
    NSDateFormatter *dateH = [[NSDateFormatter alloc]init];
    [dateH setDateFormat:@"hh"];
    NSString *th=[dateH stringFromDate:currentTime];
    NSDateFormatter *dateM = [[NSDateFormatter alloc]init];
    [dateM setDateFormat:@"mm"];
    NSString *tm=[dateM stringFromDate:currentTime];
    NSDateFormatter *dateS = [[NSDateFormatter alloc]init];
    [dateS setDateFormat:@"ss"];
    NSString *ts=[dateS stringFromDate:currentTime];
    lab_time.text=time;
    h.progress=[th floatValue]*1/12;
    m.progress=[tm floatValue]*1/60;
    s.progress=[ts floatValue]*1/60;
    if (m.progress<0.5) {
       // [self bingo];
    }

}

-(void)bingo{
    UIAlertView *bingo=[[UIAlertView alloc]initWithTitle:@"YEAHHH!!" message:@"ได้เวลากลับบ้านแล้วจ้าาาา." delegate:self cancelButtonTitle:@"OK!" otherButtonTitles: nil];
    [bingo show];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
