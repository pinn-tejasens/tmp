//
//  connectViewController.m
//  csi_las3
//
//  Created by Supasit on 5/22/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "connectViewController.h"
#import "navigationViewController.h"
#import "userData.h"


@interface connectViewController ()

@end

@implementation connectViewController
@synthesize lab_message,lab_messageDetail,atv_loading;

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
    ipHost = @"192.168.43.14";
    ipData = @"192.168.43.14";
    
    lab_message.font = [UIFont boldSystemFontOfSize:20];
    lab_messageDetail.text=NULL;
    [super viewDidLoad];
    atv_loading.hidesWhenStopped = YES;
    [atv_loading startAnimating];
    lab_message.text=@"Connecting to server";
    [self performSelector:@selector(downloadData) withObject:Nil afterDelay:0];
    

    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self
                                                          action:@selector(singleTap:)];
    [singleTapGestureRecognizer setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
   }



-(BOOL)connectionToServer{
    NSURL *urlServer = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/index.php",ipHost]];
    NSMutableURLRequest *requestServer = [NSMutableURLRequest requestWithURL:urlServer];
    if(![NSURLConnection sendSynchronousRequest:requestServer returningResponse:nil error:nil])
    {return NO;}
    else{return YES;}
}

-(void)downloadData{
    
    
     if ([self connectionToServer]==YES)
    {
    lab_message.text=@"Downloading data.";
    NSURL *urlJson = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/json.txt",ipData]];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlJson];
    NSURLConnection *conn;
    conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    }
    else
    {
        [atv_loading stopAnimating];
        lab_message.text=@"Can't connect to server.";
        lab_messageDetail.text=@"Tap to reconnect to server.";
    }

    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    data = [[NSMutableData alloc]init];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    [data appendData:theData];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;;
    JsonObj = [NSJSONSerialization JSONObjectWithData:data options:TRUE error:nil];
    NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
    arrObj=JsonObj;
    //RELOAD TABLE
    //[self.tableView reloadData];
    [atv_loading stopAnimating];
    lab_message.text=@"Download data complete.";
    
    
    userData *m=[userData alloc];
    [m setUserDataObject:arrObj];
 
    

    UIStoryboard *storyBaordId=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    navigationViewController *nextView=(navigationViewController*)[storyBaordId instantiateViewControllerWithIdentifier:@"navigationViewId"];
    [self performSegueWithIdentifier:@"naviSeque" sender:nextView];

    
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [atv_loading stopAnimating];
    lab_message.text=@"Can't download data.";
    lab_messageDetail.text=@"Tap to reload data.";

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(IBAction)singleTap:(UIGestureRecognizer*)reconizer{
    [atv_loading startAnimating];
    ipHost = @"192.168.115.23";
    lab_message.text=@"Connecting to server";
    lab_messageDetail.text=@"";
    [self performSelector:@selector(downloadData) withObject:Nil afterDelay:0];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   // navigationViewController *dest = segue.destinationViewController;
   // dest.arrUserData = arrObj;
    
}






@end
