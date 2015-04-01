//
//  StoryBook.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StoryBook : NSManagedObject


@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * createrUser;
@property (nonatomic, retain) NSString * creatorLocation;
@property (nonatomic, retain) NSString * title;

@end
