//
//  mapViewController.m
//  csi_las2
//
//  Created by Supasit on 5/26/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "mapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HomeViewController.h"

@interface mapViewController ()


@end

@implementation mapViewController
@synthesize mapViewCon,lab_message;
double lat;
CLLocationManager *locationManager;
CLLocationCoordinate2D annotationCoord1;
float annotationStartLat,annotationStartLong;

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
    [self showStartMap];
    [self currentLocation];
    mapViewCon.mapType = MKMapTypeStandard;
    mapViewCon.zoomEnabled = YES; // Zoom ได้หรือไม่
    mapViewCon.scrollEnabled = YES; // เลื่อนไปยังส่วนอื่นได้หรือไม่
    mapViewCon.showsUserLocation = YES;
    mapViewCon.userLocation.title=@"you are here";
    mapViewCon.userTrackingMode=YES;
    mapViewCon.showsBuildings = YES;
    mapViewCon.delegate = self;
	// Do any additional setup after loading the view.


    
    HomeViewController *hvc = [self.tabBarController.viewControllers objectAtIndex:0];
    userId=[hvc.arrData valueForKey:@"userId"];
    //NSLog(@"id = %@",userId);

    [self downloadData];

}


-(void)pined{
/*
    float lat=[[arrData valueForKey:@"latitude"] floatValue];
    float lon=[[arrData valueForKey:@"longtitude"] floatValue];
    NSString* siteName=[arrData valueForKey:@"siteName"];
    NSString* siteAdd=[arrData valueForKey:@"siteAddress"];
 
    
    
    annotationCoord1.latitude = lat;
    annotationCoord1.longitude = lon;
    MKPointAnnotation *annotationPoint1 = [[MKPointAnnotation alloc] init];
    annotationPoint1.coordinate = annotationCoord1;
    annotationPoint1.title = siteName;
    annotationPoint1.subtitle = siteAdd;
    [mapViewCon addAnnotation:annotationPoint1];
        MKCircle *circle = [MKCircle circleWithCenterCoordinate:annotationPoint1.coordinate radius:500];//เมตร
    [mapViewCon addOverlay:circle];*/
}


-(BOOL)connectionToServer{
    NSString *ipHost=@"192.168.43.14";
    NSURL *urlServer = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/myweb/map.php?id=%@",ipHost,userId]];
    NSMutableURLRequest *requestServer = [NSMutableURLRequest requestWithURL:urlServer];
    if(![NSURLConnection sendSynchronousRequest:requestServer returningResponse:nil error:nil])
    {return NO;}
    else{return YES;}
}

-(void)downloadData{
    
    
    if ([self connectionToServer]==YES)
    {
    NSURL *url = [NSURL URLWithString: @"http://192.168.43.14/myweb/jsonMap.txt"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn;
    conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    }
    else
    {
        

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
    //NSLog(@"jSon count : %lu",(unsigned long)[JsonObj count]);
    arrData=JsonObj;/*
    lat=[[arrData valueForKey:@"latitude"] doubleValue];*/
    //NSString* sss=[arrData valueForKey:@"latitude"];
   //double sss=[[arrData valueForKey:@"latitude"] doubleValue];
    //NSLog(@"value %@",sss);
    //ปักหมุด
    [self pined];

    //NSLog(@"%@",arrData);
}
-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"ERROR" message:@"can't connect to server" delegate:self cancelButtonTitle:@"dismiss" otherButtonTitles:
                         nil];
    [alert show];
}











- (MKOverlayView *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
{
    MKCircleView *circleView = [[MKCircleView alloc]initWithOverlay:overlay];
    circleView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:1];
    
    circleView.fillColor = [[UIColor colorWithRed:0 green:1 blue:75/255 alpha:1] colorWithAlphaComponent:0.1];
    return circleView ;

}

-(void)currentLocation{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer; // 100 m
    [locationManager startUpdatingLocation];
    
}
-(void)showStartMap{
    annotationStartLat = 13.728123;
    annotationStartLong = 100.535067;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    CLLocationCoordinate2D location;
    location.latitude = annotationStartLat;
    location.longitude = annotationStartLong;
    span.latitudeDelta = 0.05;//zoom map at start
    span.longitudeDelta = 0.01;
    region.span = span;
    region.center = location;
    // Set to that region with an animated effect
    [mapViewCon setRegion:region animated:TRUE];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
