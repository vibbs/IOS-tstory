//
//  MapViewController.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (nonatomic, retain) NSArray * arr;
@property (nonatomic, retain) NSArray * sarr;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    //NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"sline", _segValue];
    
    //[fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    //NSLog(@"%@", [[_arr lastObject] valueForKey:@"location"]);
    
    _sarr = [[NSArray alloc] initWithObjects:@"50 Daytona West Haven",@"Fox PA",@"Euclid Chirstain Church",@"555 Calero Ave", nil];
    
    for (int i=0; i<[_arr count]; i++) {
        //[self placePins:[[_arr objectAtIndex:i] valueForKey:@"location"]];
        
        [self placePins:[[_arr objectAtIndex:i] valueForKey:@"sloc"]];
    }
    
    for (int i=0; i<[_arr count]; i++) {
        
        
        [self placePins:[_sarr objectAtIndex:i]];
    }
    
   //[self populatePins];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) populatePins{
    //have to put the code to show pins of  the locations...
    
    //have to call this recursively to add all the pins
    
    //NSString *location = @"50 Daytona West Haven";
    //[self placePins:location];
    
    
}

-(void) placePins: add{
    NSString *location = add;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks && placemarks.count > 0) {
            CLPlacemark *topResult = [placemarks objectAtIndex:0];
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
            MKCoordinateRegion region = self.mapView.region;
            //region.center = placemark.region.center;
            //region.span.longitudeDelta /= 80.0;
            //region.span.latitudeDelta /= 80.0;
            
            [self.mapView setRegion:region animated:YES];
            [self.mapView addAnnotation:placemark];
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
