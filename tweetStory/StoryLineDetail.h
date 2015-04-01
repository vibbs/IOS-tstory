//
//  StoryLineDetail.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
// Interacting with Facebook & Twitter
#import <Social/Social.h>
#import "AppDelegate.h"

@interface StoryLineDetail : UIViewController

@property  (nonatomic, retain) NSString * segValue;


@property (weak, nonatomic) IBOutlet UILabel *lbtitle;

@property (weak, nonatomic) IBOutlet UILabel *lbsline;

@property (weak, nonatomic) IBOutlet UILabel *lbCuser;

@property (weak, nonatomic) IBOutlet UILabel *lbuser;




- (IBAction)postToFacebook:(id)sender;

- (IBAction)sendATweet:(id)sender;

-(void)refreshView;

-(void)getCuser;




@end
