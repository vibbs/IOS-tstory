//
//  Sline.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sline : NSManagedObject

@property (nonatomic, retain) NSString * sline;
@property (nonatomic, retain) NSString * sloc;
@property (nonatomic, retain) NSString * sname;
@property (nonatomic, retain) NSData * media;
@property (nonatomic, retain) NSString * title;

@end
