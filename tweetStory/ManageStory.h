//
//  ManageStory.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
// Interacting with Facebook & Twitter
#import <Social/Social.h>
#import "AppDelegate.h"
#import "StoryAdd.h"

@interface ManageStory : UIViewController

@property  (nonatomic, retain) NSString * segValue;

- (IBAction)postToFacebook:(id)sender;

- (IBAction)sendATweet:(id)sender;

-(void)refreshView;

@end
