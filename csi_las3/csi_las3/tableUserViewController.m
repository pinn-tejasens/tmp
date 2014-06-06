//
//  tableUserViewController.m
//  csi_las3
//
//  Created by Supasit on 5/16/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "tableUserViewController.h"
#import "navigationViewController.h"
#import "userData.h"


@interface tableUserViewController ()

@end

@implementation tableUserViewController
@synthesize arrUserDataTable,strData;

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
    NSLog(@"%@",strData);
    userData *m = [userData alloc];
    arr = [[NSMutableArray alloc]init];
    int a;
    int b;
    
    
    for (a=100; a>0;a--) {
        b=arc4random() % 10+1;
        [arr addObject:[NSString stringWithFormat:@"%d",b]];
        
        
      
    }

    
NSLog(@"jsonTable %lu",(unsigned long)arrUserDataTable.count);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigati
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
   
    cell.textLabel.text=[NSString stringWithFormat:@"R:%@ G:%@ B:%@",[[self myMethod] valueForKey:@"rc1"],[[self myMethod] valueForKey:@"rc2"],[[self myMethod] valueForKey:@"rc3"] ];
    cell.backgroundColor=[[self myMethod] valueForKey:@"color"];

    
    
    return cell;
}
-(NSDictionary *) myMethod
{
    
    
    
    
        NSMutableDictionary *toReturn = [NSMutableDictionary dictionary];
    UIColor *randColor;
    float fValue=255.0;
    float rc1 = 0.0;
    float rc2 = 0.0;
    float rc3 = 0.0;
    
    rc1=(((float)arc4random() / RAND_MAX) * 255.0)/fValue;
    rc2=(((float)arc4random() / RAND_MAX) * 255.0)/fValue;
    rc3=(((float)arc4random() / RAND_MAX) * 255.0)/fValue;
    randColor=[UIColor colorWithRed:rc1 green:rc2 blue:rc3 alpha:1.0];
    rc1=[[NSString stringWithFormat:@"%.2f",rc1] floatValue];
    rc2=[[NSString stringWithFormat:@"%.2f",rc2] floatValue];
    rc3=[[NSString stringWithFormat:@"%.2f",rc3] floatValue];
    
    
    NSNumber *aNumber = [NSNumber numberWithFloat:rc1];
    NSNumber *bNumber = [NSNumber numberWithFloat:rc2];
    NSNumber *cNumber = [NSNumber numberWithFloat:rc3];
    

    [toReturn setObject:randColor forKey:@"color"];
    [toReturn setValue:aNumber forKey:@"rc1"];
    [toReturn setValue:bNumber forKey:@"rc2"];
    [toReturn setValue:cNumber forKey:@"rc3"];
     
    
    
    
    return toReturn;
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
