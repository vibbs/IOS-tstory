//
//  StoryCreate&Add.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Storyline.h"
#import "StoryBook.h"
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>
#import "ListStoryLine.h"
#import "PicturesViewController.h"




@interface StoryCreate_Add : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *place;
}
@property  (nonatomic, retain) NSString * segValue;

@property (weak, nonatomic) IBOutlet UIImageView *set;

@property (nonatomic, retain) UIImage * media;

@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextField *storylineText;
@property (strong, nonatomic) IBOutlet UITextField *categoryText;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
@property (strong, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)useLocation:(UISwitch *)sender;
- (IBAction)useName:(id)sender;
- (IBAction)createStory:(id)sender;

@property (strong, nonatomic) CLLocationManager * locationManager;

@property (weak, nonatomic) IBOutlet UIDatePicker *date;



- (IBAction)hideKeyboard:(id)sender;

@end
