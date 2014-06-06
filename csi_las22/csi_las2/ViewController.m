//
//  ViewController.m
//  csi_las2
//
//  Created by Supasit on 5/15/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController
@synthesize out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,dataArray,out_clear,out_backSpace;
@synthesize lab_userName,lab_lastName,pass1,pass2,pass3,pass4,lab_email,lab_phone;
@synthesize YourImageview;
NSInteger id_number,btn,cntPass;
NSString *password;
NSString *user;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fillPassToblank];
    
    cntPass=1;
    password=@"";
    NSString *imgName=[NSString stringWithFormat:@"http://192.168.43.14/myweb/img/%@.png",[dataArray valueForKey:@"name"]];
    imgName = [imgName stringByReplacingOccurrencesOfString:@" " withString:@""];
    UIImage *userImg=[UIImage imageWithData:[NSData dataWithContentsOfURL:
                    [NSURL URLWithString:imgName]]];
    
    YourImageview.image=userImg;
    CALayer *imageLayer = YourImageview.layer;
    [imageLayer setCornerRadius: 40];
    [imageLayer setBorderWidth:3];
    [imageLayer setBorderColor:[[UIColor whiteColor]CGColor]];
    [imageLayer setMasksToBounds:YES];
    [imageLayer setBackgroundColor:[[UIColor whiteColor]CGColor]];
    [imageLayer setShadowColor:[[UIColor blackColor]CGColor]];
    
    [self setButtonBackground];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login"]];
   
    
    
    

    //UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMethod:)];
   //[self.view addGestureRecognizer:panGesture];
  
    lab_phone.textColor=[UIColor whiteColor];
    lab_phone.text=[lab_phone.text stringByAppendingString:[dataArray valueForKey:@"telephone"]];
    lab_email.textColor=[UIColor whiteColor];
    lab_email.text=[lab_email.text stringByAppendingString:[dataArray valueForKey:@"email"]];

    
    lab_userName.textColor=[UIColor whiteColor];
    lab_lastName.textColor=[UIColor whiteColor];
    lab_userName.text=[dataArray valueForKey:@"name"];;
    lab_lastName.text=[dataArray valueForKey:@"lastName"];
}







/*



- (void)panMethod:(UIPanGestureRecognizer*)gestureRecognizer{
    
    CGPoint touchBegan;
    CGPoint pointEnd;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        CGPoint touchBegan = [gestureRecognizer locationInView: gestureRecognizer.view];
        NSLog(@"pointBegan:%@",NSStringFromCGPoint(touchBegan));
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
    }
    
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded     ||
             gestureRecognizer.state == UIGestureRecognizerStateCancelled ||
             gestureRecognizer.state == UIGestureRecognizerStateFailed)
    {
        pointEnd = [gestureRecognizer locationInView:gestureRecognizer.view];
        NSLog(@"pointEnd:%@", NSStringFromCGPoint(pointEnd));
        CGFloat xDist = (pointEnd.x - touchBegan.x);
        CGFloat yDist = (pointEnd.y - touchBegan.y);
        CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist));
        if (distance>200) {
            NSLog(@"distance:%f\n\n", distance); 
        }
       
    }
    
    
}

*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)btn_1:(id)sender {btn=1;[self checkClick];}
- (IBAction)btn_2:(id)sender {btn=2;[self checkClick];}
- (IBAction)btn_3:(id)sender {btn=3;[self checkClick];}
- (IBAction)btn_4:(id)sender {btn=4;[self checkClick];}
- (IBAction)btn_5:(id)sender {btn=5;[self checkClick];}
- (IBAction)btn_6:(id)sender {btn=6;[self checkClick];}
- (IBAction)btn_7:(id)sender {btn=7;[self checkClick];}
- (IBAction)btn_8:(id)sender {btn=8;[self checkClick];}
- (IBAction)btn_9:(id)sender {btn=9;[self checkClick];}
- (IBAction)btn_0:(id)sender {btn=0;[self checkClick];}

- (IBAction)btn_clear:(id)sender {
}

- (IBAction)btn_backSpace:(id)sender {
}


-(void)checkClick{
    [self fillPass];
    cntPass++;
}
-(void)fillPass{
    password=[password stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)btn]];
    NSLog(@"pass = %@",password);
    UIColor *filling=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_fill"]];
    if (cntPass==1) {pass1.backgroundColor=filling;}
    if (cntPass==2) {pass2.backgroundColor=filling;}
    if (cntPass==3) {pass3.backgroundColor=filling;}
    if (cntPass==4) {pass4.backgroundColor=filling;[self performSelector:@selector(checkPassWord) withObject:nil afterDelay:1/2];}
}


-(void)incorectPassword{
    UIColor *filling=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_wrong"]];
    pass1.backgroundColor=filling;
    pass2.backgroundColor=filling;
    pass3.backgroundColor=filling;
    pass4.backgroundColor=filling;
    [self performSelector:@selector(resetPassword) withObject:nil afterDelay:1];
}

-(void)resetPassword{
    UIColor *noColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_un"]];
    pass1.backgroundColor=noColor;
    pass2.backgroundColor=noColor;
    pass3.backgroundColor=noColor;
    pass4.backgroundColor=noColor;
    cntPass=1;
    password=@"";
}



    - (UIImage *)blendOverlay:(UIImage *)topImage withBaseImage:(UIImage *)baseImage toSize:(CGFloat)imageSize
    {
        
        [topImage drawInRect:CGRectMake(0.0, 0.0, imageSize, imageSize) blendMode:kCGBlendModeNormal alpha:0.5];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }

-(void)setButtonBackground{


    
    
    
    [out_1 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_1 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_2 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_2 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_3 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_3 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_4 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_4 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_5 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_5 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_6 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_6 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_7 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_7 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_8 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_8 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_9 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_9 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_0 setBackgroundImage:[UIImage imageNamed:@"btn_number"] forState:UIControlStateNormal];
    [out_1 setBackgroundImage:[UIImage imageNamed:@"btn_number_hl"] forState:UIControlStateHighlighted];
    [out_clear setBackgroundImage:[UIImage imageNamed:@"btn_number"]forState:UIControlStateNormal];
    [out_backSpace setBackgroundImage:[UIImage imageNamed:@"btn_number"]forState:UIControlStateNormal];
    
}
-(void)fillPassToblank{
    pass1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_un"]];
    pass2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_un"]];
    pass3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_un"]];
    pass4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pass_un"]];
}
-(void)checkPassWord{
    UIStoryboard *storyBaordId=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *nextView=(HomeViewController*)[storyBaordId instantiateViewControllerWithIdentifier:@"HomeViewController"];
    if ([password isEqualToString:[dataArray valueForKey:@"password"]])
    {
    [self performSegueWithIdentifier:@"sequeMap" sender:nextView];
       
        
        
    }else{NSLog(@"INCORECT"); [self incorectPassword];}
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    
    if ([segue.identifier isEqualToString:@"sequeMap"]) {
    HomeViewController *desViewController = segue.destinationViewController;
    NSLog(@"name to sent %@",[dataArray valueForKey:@"name"]);

    HomeViewController* vc = [[HomeViewController alloc] init];
    UITabBarController* tbc = [segue destinationViewController];
    vc = (HomeViewController *)[[tbc customizableViewControllers] objectAtIndex:0];
    vc.arrData=dataArray;
        
    }else{NSLog(@"error seque");}
    
}


@end
