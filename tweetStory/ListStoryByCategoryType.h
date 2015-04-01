//
//  ListStoryByCategoryType.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ListStoryLine.h"

@interface ListStoryByCategoryType : UITableViewController

@property  (nonatomic, retain) NSString * segValue;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

-(IBAction)unwindtoline:(UIStoryboardSegue *)seg;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureSwipeLeft;
@end
