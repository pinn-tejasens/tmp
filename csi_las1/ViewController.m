//
//  ViewController.m
//  csi_las1
//
//  Created by Supasit on 5/15/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize lab_loading,atv_loading;

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSLog (@"%f",self.view.frame.size.height);
   // NSLog (@"%f",self.view.frame.size.width);
    self.view.backgroundColor=[UIColor colorWithPatternImage:[ UIImage imageNamed:@"bg_loading.png"]  ];
    lab_loading.textColor=[UIColor whiteColor];
    [self connectToHost];
}
//Connection
//------------------------------------------------------------------------------------------------------

-(void)connectToHost{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    [self startAtv];
    lab_loading.text=@"Loading...";
    //int rand = arc4random() % 4;
    NSURL *url;

    url  = [NSURL URLWithString: @"http://192.168.43.14/myweb/json.txt"];
    //connect
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn;
    conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    data = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    [data appendData:theData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self stopAtv];
    //NSArray *JsonObj;
    //JsonObj = [NSJSONSerialization JSONObjectWithData:data options:TRUE error:nil];
    //pass value to another view
    //LoginViewController *screen = [[LoginViewController alloc] init];
   // screen->JsonObj = JsonObj;
   // JsonObj = [NSJSONSerialization JSONObjectWithData:data options:TRUE error:nil];
    //NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
   //NSLog(@"%@",[[JsonObj objectAtIndex:4]objectForKey:@"name"]);
    //go to login view
    UIStoryboard *storyBoardId =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *nextView=(LoginViewController*)[storyBoardId instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:nextView animated:YES completion:nil];
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *errorView = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Connectionless" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [errorView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    lab_loading.text=@"Tap to reloading data";
    [self stopAtv];
 
}

//--------------------------------------------------------------------------------------------------------


-(void)stopAtv{
    [atv_loading stopAnimating ];
    atv_loading.hidden=YES;
}
-(void)startAtv{
    [atv_loading  startAnimating];
    atv_loading.hidden=NO;
}

- (IBAction)btn_reload:(id)sender {
    [self connectToHost];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
