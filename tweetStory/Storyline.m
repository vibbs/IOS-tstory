//
//  Storyline.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "Storyline.h"

@interface Storyline()
@property (nonatomic, retain) NSString * sline;
@property (nonatomic, retain) NSString * sloc;
@property (nonatomic, retain) NSString * sname;
@property (nonatomic) UIImage * media;

@end

@implementation Storyline




-(void)setSline:(NSString *)sline{
    _sline = sline;
    
}
-(void)setSloc:(NSString *)sloc{
    _sloc=sloc;
    
}
-(void)setSname:(NSString *)sname{
    _sname = sname;
    
}
-(void)setMedia:(UIImage *)media{
    _media =media;
}

-(NSString *)getSline{
    return _sline;
    
}
-(NSString *)getSloc{
    return _sloc;
    
}
-(NSString *)getName{
    return _sname;
    
}
-(UIImage *)getMedia{
    return _media;
}


@end


