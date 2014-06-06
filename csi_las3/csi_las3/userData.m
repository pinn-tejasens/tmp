
#import "userData.h"
#import "navigationViewController.h"

@implementation userData
@synthesize userDataObject;


-(void)setUserDataObject:(NSArray *)data{
    data=userDataObject;
}

-(BOOL)checkConnectionWithuser:(NSString *)user password:(NSString *)pass{
    ipHost = @"192.168.43.14";
    ipData = @"192.168.43.14";
    [self downloadData];
    return YES;
}

-(BOOL)connectionToServer{
    NSURL *urlServer = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/index.php",ipHost]];
    NSMutableURLRequest *requestServer = [NSMutableURLRequest requestWithURL:urlServer];
    if(![NSURLConnection sendSynchronousRequest:requestServer returningResponse:nil error:nil])
    {return NO;}
    else
    {return YES;}
}

-(void)downloadData{
    if ([self connectionToServer]==YES)
    {
        NSURL *urlJson = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/json.txt",ipData]];
        NSURLRequest *request = [NSURLRequest requestWithURL:urlJson];
        NSURLConnection *conn;
        conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];

    }
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    data = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    [data appendData:theData];
}

-(bool)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;;
    JsonObj = [NSJSONSerialization JSONObjectWithData:data options:TRUE error:nil];
    NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
    arrObj=JsonObj;
    return YES;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"fail");
}


@end