#import "ConnectObject.h"

@implementation ConnectObject
@synthesize  conn;

-(BOOL)connection{
    ipHost=@"192.168.43.14";
    ipData=@"192.168.43.14";
    if([self downloadData])
    {return  YES;}
    else return NO;
}




-(BOOL)connectionToServer{
    NSURL *urlServer = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/index.php",ipHost]];
    NSMutableURLRequest *requestServer = [NSMutableURLRequest requestWithURL:urlServer];
    if([NSURLConnection sendSynchronousRequest:requestServer returningResponse:nil error:nil])
    {return YES;}
    else return NO;
}

-(BOOL)connectionToData{
    NSURL *urlServer = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/json.txt",ipData]];
    NSMutableURLRequest *requestServer = [NSMutableURLRequest requestWithURL:urlServer];
    if([NSURLConnection sendSynchronousRequest:requestServer returningResponse:nil error:nil])
    {return YES;}
    else return NO;
}

-(BOOL)downloadData{
    if ([self connectionToServer]==YES&&[self connectionToData]==YES)
    {return YES;}
    else return NO;
}


/*
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{}
*/




@end







