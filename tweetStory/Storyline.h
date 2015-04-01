//
//  Storyline.h
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Storyline : NSObject


-(void)setSline:(NSString *)sline;
-(void)setSloc:(NSString *)sloc;
-(void)setSname:(NSString *)sname;
-(void)setMedia:(UIImage *)media;

-(NSString *)getSline;
-(NSString *)getSloc;
-(NSString *)getName;
-(UIImage *)getMedia;


@end
