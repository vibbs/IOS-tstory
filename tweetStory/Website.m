//
//  Website.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "Website.h"

@interface Website ()

@end

@implementation Website

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)load {
    NSLog(@"Loading webpage...");
    NSURL *url = [NSURL URLWithString:@"http://tweetstory.herokuapp.com/home.html"];
    
    NSLog(@"Current path is %@", url.path);
    
  
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [_mywebview loadRequest:request];
}

@end
