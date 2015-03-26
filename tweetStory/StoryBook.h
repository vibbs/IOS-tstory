//
//  StoryBook.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Storyline;

@interface StoryBook : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * createrUser;
@property (nonatomic, retain) NSString * creatorLocation;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *storylines;
@end

@interface StoryBook (CoreDataGeneratedAccessors)

- (void)addStorylinesObject:(Storyline *)value;
- (void)removeStorylinesObject:(Storyline *)value;
- (void)addStorylines:(NSSet *)values;
- (void)removeStorylines:(NSSet *)values;





@end
