//
//  StoryCreate&Add.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "StoryCreate&Add.h"

@interface StoryCreate_Add ()


@property (nonatomic,retain) StoryBook * thistory;
@property (nonatomic) NSUInteger countloc;
@property (nonatomic) NSUInteger countnam;



@end

@implementation StoryCreate_Add
@synthesize locationManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _countloc = 0;
    _countnam = 0;
    
    NSLog(@"entered the view did load for create and add stories");
    self.locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        NSLog(@"entered the location is condition");
        
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    
    
 
    
   
    [self refresh];
    
}

-(void) refresh{
   [_set setImage:_media];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)useLocation:(UISwitch *)sender {
    _countloc++;
    
    //code to get the current location
    NSLog(@"entered the location button pressed");
    
 
   
    
 
    
    //check for the location add
    if (_countloc%2==0) {
        NSLog(@"@%lu",_countloc%2);
         [self.locationManager startUpdatingLocation];
    }else
        _locationText.text  = @"UNKNOWN";
   
}

- (IBAction)useName:(id)sender {
    _countnam++;
    if (_countnam%2==0) {
        _nameText.text = @"Username";
    }else
        _nameText.text = @"Anon";
    
}

- (IBAction)createStory:(id)sender {
    
    NSLog(@"createstroy clicked");
    NSString* sline = _storylineText.text;
    NSString* stitle = _titleText.text;
    NSString* scategory = _categoryText.text;
    NSString* slocation =_locationText.text;
    NSString* sname = _nameText.text;
    
    NSLog(@"%@", sline);
    NSLog(@"%@", stitle);
    NSLog(@"%@", scategory);
    NSLog(@"%@", slocation);
     NSLog(@"%@", sname);
    
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *storyLineDescription = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    NSEntityDescription *storyBookDescription = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:app.managedObjectContext];
    
    NSManagedObject *thisStoryLine = [[NSManagedObject alloc] initWithEntity:storyLineDescription insertIntoManagedObjectContext:app.managedObjectContext];
    
    [thisStoryLine setValue:_media forKey:@"media"];
    [thisStoryLine setValue:slocation forKey:@"sloc"];
    [thisStoryLine setValue:sname forKey:@"sname"];
    [thisStoryLine setValue:sline forKey:@"sline"];
    [thisStoryLine setValue:stitle forKey:@"title"];
  
    
    
    
    NSManagedObject *thisStoryBook = [[NSManagedObject alloc] initWithEntity:storyBookDescription insertIntoManagedObjectContext:app.managedObjectContext];
    
    
    
    //have to check out how to add object
    

    
    
    //TO_DO have to implement story image file storage
    
   
    
    [thisStoryBook setValue:stitle forKey:@"title"];
    [thisStoryBook setValue:sname forKey:@"createrUser"];
    [thisStoryBook setValue:slocation forKey:@"creatorLocation"];
    [thisStoryBook setValue:scategory forKey:@"category"];
    
    
  
    NSError *ee =nil;
    if(![thisStoryLine.managedObjectContext save:&ee]){
        NSLog(@"unable to save");
        NSLog(@"%@, %@", ee, ee.localizedDescription);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                              message:@"Unable to store"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
        [myAlertView show];
        
    }
    
   
    
    NSError *eee =nil;
    if(![thisStoryBook.managedObjectContext save:&eee]){
        NSLog(@"unable to save");
        NSLog(@"%@, %@", eee, eee.localizedDescription);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                              message:@"Unable to store"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
        [myAlertView show];
        
    }else{
    
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Sucess"
                                                          message:@"Story Created"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
    [myAlertView show];
    
    }
    
   
    
   
    
    //[self presentViewController:ListStoryline animated:YES completion:nil];
 
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){ //Next
        UIViewController* newView = [[UIViewController alloc] init];
        [self presentViewController:newView animated:YES completion:nil];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    CLLocation *currentLocation = newLocation;
    NSLog(@"%@", currentLocation);
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error == nil && [placemarks count] > 0) {
            place = [placemarks lastObject];
            
            NSLog(@"Area: %@", place.administrativeArea);
            NSLog(@"City: %@", place.locality);
            NSLog(@"Code: %@", place.postalCode);
            NSLog(@"Road: %@", place.thoroughfare);
            NSLog(@"Number: %@", place.name);
            
            _locationText.text = place.name;
            
            // Stop Location Manager
            [self.locationManager stopUpdatingLocation];
            
        } else {
            NSLog(@"%@", error.debugDescription);
            [self.locationManager stopUpdatingLocation];
            
        }
    }];
}


- (IBAction)hideKeyboard:(id)sender {
    [sender resignFirstResponder];
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_titleText isFirstResponder] && [touch view] != _titleText) {
        [_titleText resignFirstResponder];
    }else
        if ([_storylineText isFirstResponder] && [touch view] != _storylineText) {
            [_storylineText resignFirstResponder];
        }else
            if ([_categoryText isFirstResponder] && [touch view] != _categoryText) {
                [_categoryText resignFirstResponder];
            }else
                if ([_locationText isFirstResponder] && [touch view] != _locationText) {
                    [_locationText resignFirstResponder];
                }else
                    if ([_nameText isFirstResponder] && [touch view] != _nameText) {
                        [_nameText resignFirstResponder];
                    }
    [super touchesBegan:touches withEvent:event];
}





@end
