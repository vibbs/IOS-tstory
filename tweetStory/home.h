//
//  home.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryCreate&Add.h"

@interface home : UIViewController

-(IBAction)unwindtohome:(UIStoryboardSegue *)seg ;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureSwipeLeft;

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *gestureLongPress;


@end
