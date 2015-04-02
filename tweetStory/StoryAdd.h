//
//  StoryAdd.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/26/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "CoreLocation/CoreLocation.h"
#import "PicturesViewController.h"

@interface StoryAdd : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *place;
}

@property  (nonatomic, retain) NSString * segValue;

@property (nonatomic, retain) UIImage * media;

@property (weak, nonatomic) IBOutlet UIImageView *set;

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@property (weak, nonatomic) IBOutlet UILabel *lbCategory;

@property (strong, nonatomic) IBOutlet UITextField *storylineText;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
@property (strong, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)useLocation:(id)sender;
- (IBAction)useName:(id)sender;


- (IBAction)addStoryLine:(id)sender;

- (IBAction)hideKeyboard:(id)sender;

@property (strong, nonatomic) CLLocationManager * locationManager;

@property (weak, nonatomic) IBOutlet UIDatePicker *date;


@end
