//
//  StoryAdd.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/26/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "StoryAdd.h"

#define kOFFSET_FOR_KEYBOARD 150.0

@interface StoryAdd ()

@property (nonatomic) NSUInteger countloc;
@property (nonatomic) NSUInteger countnam;

@property (nonatomic, retain) NSArray * arr;
@property (nonatomic,retain) NSArray * sarr;
@property (nonatomic,retain) NSManagedObject * thisline;
@property (nonatomic,retain) NSManagedObject * thisstory;

@end

@implementation StoryAdd

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.title = _segValue;
    
    _countloc = 0;
    _countnam = 0;
    /**********************************************************************************/
    
    NSLog(@"entered the view did load");
    self.locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        NSLog(@"entered the if condition");
        
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    /**********************************************************************************/
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", _segValue];
    
    [fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    _thisline = [_arr lastObject];
    /**********************************************************************************/
    AppDelegate *sapp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *sfetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *sentity = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:sapp.managedObjectContext];
    [sfetchRequest setEntity:sentity];
    
    NSPredicate *sexactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", [_thisline valueForKey:@"title"]];
    
    [sfetchRequest setPredicate:sexactPredicate];
    
    NSError *serr = nil;
    _sarr = [sapp.managedObjectContext executeFetchRequest:sfetchRequest error:&serr];
    
    _thisstory = [_sarr lastObject];
    
    
    //[self getCuser];
    
    [self refreshView];
    [self refresh];
}

-(void)refreshView{
    
    NSLog(@"%@", [_thisline valueForKey:@"title"]);
    NSLog(@"%@",[_thisstory valueForKey:@"category"]) ;
    
    [_lbTitle setText:[_thisline valueForKey:@"title"]];
    
    [_lbCategory setText:[_thisstory valueForKey:@"category"]];
    
}



-(void) refresh{
   
    [_set setImage:_media];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)useLocation:(id)sender {
    _countloc++;
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

- (IBAction)addStoryLine:(id)sender {
    NSLog(@"addstroy clicked");
    
    NSLog(@"createstroy clicked");
    NSString* sline = _storylineText.text;
    NSString* stitle = [_thisline valueForKey:@"title"];
    NSString* scategory = [_thisstory valueForKey:@"category"];
    NSString* slocation =_locationText.text;
    NSString* sname = _nameText.text;

    NSLog(@"%@", sline);
    NSLog(@"%@", stitle);
    NSLog(@"%@", scategory);
    NSLog(@"%@", slocation);
    NSLog(@"%@", sname);
    
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *storyLineDescription = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    
    NSManagedObject *thisStoryLine = [[NSManagedObject alloc] initWithEntity:storyLineDescription insertIntoManagedObjectContext:app.managedObjectContext];
    
    [thisStoryLine setValue:_media forKey:@"media"];
    [thisStoryLine setValue:slocation forKey:@"sloc"];
    [thisStoryLine setValue:sname forKey:@"sname"];
    [thisStoryLine setValue:sline forKey:@"sline"];
    [thisStoryLine setValue:stitle forKey:@"title"];
    
    NSError *eee =nil;
    if(![thisStoryLine.managedObjectContext save:&eee]){
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

    

     
     
    
    
}



- (IBAction)hideKeyboard:(id)sender{
    [_storylineText resignFirstResponder];
}


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





/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
   
        if ([_storylineText isFirstResponder] && [touch view] != _storylineText) {
            [_storylineText resignFirstResponder];
        }else
           
                if ([_locationText isFirstResponder] && [touch view] != _locationText) {
                    [_locationText resignFirstResponder];
                }else
                    if ([_nameText isFirstResponder] && [touch view] != _nameText) {
                        [_nameText resignFirstResponder];
                    }
    [super touchesBegan:touches withEvent:event];
}


-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_locationText]||[sender isEqual:_nameText])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}



-(IBAction)unwindtoaddstory:(UIStoryboardSegue *)seg {
    PicturesViewController  *vc = seg.sourceViewController;
    
    _media = vc.send;
    
    
}



@end
