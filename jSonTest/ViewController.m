//
//  ViewController.m
//  jSonTest
//
//  Created by Supasit on 5/9/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "ViewController.h"
#include <string.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize labName;
@synthesize lab_id,lab_lastname,lab_name,lab_pos;
UIAlertView *alerta;
NSInteger id_number;
- (void)viewDidLoad
{[super viewDidLoad];
    dataArray = [[NSArray alloc]initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];

    
    lab_id.enabled=NO;
    lab_name.placeholder=@"Name";
    lab_lastname.placeholder=@"Last name";
    lab_pos.placeholder=@"Position";
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    [self alert];
      //  [self insert];
    [self writeJson];

    NSURL *url = [NSURL URLWithString: @"http://192.168.43.14/myweb/json.txt"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn;
    conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [dataArray count];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
}/*
  TEXT CENTER IN PICKER VIEW
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    
    return name;
}*/

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
     NSString *fn=[[dataArray objectAtIndex:row]objectForKey:@"name"];
    
    NSString *ln =[[dataArray objectAtIndex:row]objectForKey:@"lastName"];
    NSString *name=[fn stringByAppendingString:ln];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0.0f, 300.0f, 60.0f)]; //x and width are mutually correlated
    label.textAlignment = NSTextAlignmentLeft;
    
    label.text = name;
    
    return label;
}


-(void)insert{
    NSArray *arr=[[NSArray alloc]initWithObjects:@"This is A",@"ssxnn", nil];
    NSArray *arrk=[[NSArray alloc]initWithObjects:@"a",@"b", nil];
    NSDictionary *dataDict =[[NSDictionary alloc]initWithObjects:arr forKeys:arrk];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
     NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
       
        //NSLog(@"jSon string : %@",jsonString);
    }
    
    
    NSString *host = @"http://192.168.43.14/myweb/jsonInsert.php?myvar=%@&quot";
       NSString *urlString = [NSString stringWithFormat:host,jsonString];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"{" withString:@"("];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"}" withString:@")"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"\"" withString:@"*"];
    NSLog(@"url = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url = %@",url);
   // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * rerror = nil;
    [NSURLConnection sendSynchronousRequest:urlRequest
                          returningResponse:&response
                                      error:&rerror];
    
    if (rerror == nil)
    {NSLog(@"Done");
        
    }else {NSLog(@"ERROR %@",error);}
    
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
    id_number=([JsonObj count]+1);
  
    lab_id.placeholder=[NSString stringWithFormat:@"ID : %li",(long)id_number];
    NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
   // NSLog(@"%@",[[JsonObj objectAtIndex:7]objectForKey:@"name"]);
    
   dataArray=JsonObj;
  //  dataArray=[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    myPicker.delegate = self;
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *errorView = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Connectionless" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [errorView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)sliName:(id)sender {
    UISlider *a =sender;
    a.maximumValue=[JsonObj count]-1;
    NSString *fName=[[JsonObj objectAtIndex:a.value]objectForKey:@"name"];
    NSString *lName=[[JsonObj objectAtIndex:a.value]objectForKey:@"lastName"];
    labName.text = [NSString stringWithFormat:@"%@%@",fName,lName];
}
-(void)writeJson{
    NSString *host = @"http://192.168.43.14/myweb/up.php?myvar=%@&quot";
    NSString *urlString = [NSString stringWithFormat:host, @"This+is+text+from+xCode"];
    NSURL *url = [NSURL URLWithString:urlString];
    //check request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
[NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    

    
    
    
     
}








-(void)alert{
    
    alerta = [[UIAlertView alloc] initWithTitle:@"Please wait"
                                        message:@"Loading....."
                                       delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:nil];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   // spinner.center = CGPointMake(139.5, 75.5); // .5 so it doesn't blur
    spinner.frame=CGRectMake(150, 150, 16, 16);
    [alerta addSubview:spinner];
    [spinner startAnimating];
    [alerta show];
    
    
    [self performSelector:@selector(close) withObject:self afterDelay:1];
}



-(void)close{
    
    [alerta dismissWithClickedButtonIndex:0 animated:YES];
    
}
-(NSString*)getId{
    
    
    return @"id_no";
}





- (IBAction)act_insert:(id)sender {
    NSString *strID,*strName,*strLastName,*strPos;
    strID=[NSString stringWithFormat:@"%ld",(long)id_number];
    strName=lab_name.text;
    strLastName=lab_lastname.text;
    strPos=lab_pos.text;
    
    
    
    NSArray *arr=[[NSArray alloc]initWithObjects:strID,strName,strLastName,strPos, nil];
    NSArray *arrk=[[NSArray alloc]initWithObjects:@"id",@"name",@"lastName",@"pos", nil];
    NSDictionary *dataDict =[[NSDictionary alloc]initWithObjects:arr forKeys:arrk];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        
        //NSLog(@"jSon string : %@",jsonString);
    }
    
    
    NSString *host = @"http://192.168.43.14/myweb/jsonInsert.php?myvar=%@&quot";
    NSString *urlString = [NSString stringWithFormat:host,jsonString];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"{" withString:@"("];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"}" withString:@")"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"\"" withString:@"*"];
    NSLog(@"url = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url = %@",url);
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * rerror = nil;

    
    if(![NSURLConnection sendSynchronousRequest:urlRequest
                          returningResponse:&response
                                         error:&rerror]&&rerror!=Nil){
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Opps." message:rerror delegate:self cancelButtonTitle:@"Dismiss"otherButtonTitles: nil];[al show];
    
    }else{UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Done." message:@"process complete" delegate:self cancelButtonTitle:@
                           "OK"otherButtonTitles: nil];[al show];}
}
@end
