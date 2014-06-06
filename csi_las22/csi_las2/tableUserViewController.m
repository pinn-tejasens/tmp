//
//  tableUserViewController.m
//  csi_las2
//
//  Created by Supasit on 5/16/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "tableUserViewController.h"
#import "ViewController.h"

@interface tableUserViewController ()

@end

@implementation tableUserViewController
@synthesize tableCell,title;
UIAlertView *connAlert;
 UIAlertView *loadAlert;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self conn];
    
    
    
}


-(void)conn{
    NSURL *url = [NSURL URLWithString: @"http://192.168.43.14/myweb/json.txt"];
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;;
    JsonObj = [NSJSONSerialization JSONObjectWithData:data options:TRUE error:nil];
    NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
    arrName=JsonObj;
    [self.tableView reloadData];
}


-(void)test:(UIAlertView*)x{
	[x dismissWithClickedButtonIndex:-1 animated:YES];
}



- (void)didReceiveMemoryWarning
{[super didReceiveMemoryWarning];}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"⚪ %@",[[arrName objectAtIndex:indexPath.row]objectForKey:@"name"]];
   //cell.textLabel.textAlignment=NSTextAlignmentLeft;
    cell.textLabel.textColor=[UIColor colorWithRed:50.0/255.0 green:60.0/255.0 blue:60.0/255.0 alpha:1];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"tel : %@",[[arrName objectAtIndex:indexPath.row]objectForKey:@"telephone" ]];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login.png"]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    //if ([segue.identifier isEqualToString:@"showDetails"]) {
    NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
    ViewController *desViewController = segue.destinationViewController;
    //desViewController.nameSmartphone=[arrName objectAtIndex:indexPath.row];
    desViewController.dataArray=[arrName objectAtIndex:indexPath.row];
    
    
    //}

    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
