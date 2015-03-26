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


@interface StoryCreate_Add : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextField *storylineText;
@property (strong, nonatomic) IBOutlet UITextField *categoryText;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
@property (strong, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)useLocation:(UISwitch *)sender;
- (IBAction)useName:(id)sender;
- (IBAction)createStory:(id)sender;


@end
