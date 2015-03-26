//
//  Storyline.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Storyline : NSManagedObject

@property (nonatomic, retain) NSData * media;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * storyline;

@end
