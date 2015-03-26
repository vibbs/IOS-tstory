//
//  StoryAdd.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/26/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface StoryAdd : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbTitle;

@property (strong, nonatomic) IBOutlet UILabel *lbCategory;

@property (strong, nonatomic) IBOutlet UITextField *storylineText;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
@property (strong, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)useLocation:(id)sender;
- (IBAction)useName:(id)sender;


- (IBAction)addStoryLine:(id)sender;

@end
