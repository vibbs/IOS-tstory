//
//  ListByCategories.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Storyline.h"
#import "StoryBook.h"
#import "AppDelegate.h"
#import "ListStoryByCategoryType.h"

@interface ListByCategories : UITableViewController

@property  (nonatomic, retain) NSString * segValue;


@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *gestureSwipeLeft;
- (IBAction)userSwipedLeft:(id)sender;
@end
