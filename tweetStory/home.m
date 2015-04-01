//
//  home.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/28/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "home.h"

@interface home ()
@property (nonatomic) NSUInteger counter;

@end

@implementation home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _counter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindtohome:(UIStoryboardSegue *)seg {
    StoryCreate_Add  *vc = seg.sourceViewController;
    
}

- (IBAction)userSwipedLeft:(id)sender {
    NSLog(@"User Swiped Left");
     NSLog(@"%lu",[sender direction]);
    
    [self performSegueWithIdentifier:@"NewStory" sender:self];
}

- (IBAction)userDidLongPress:(id)sender {
    _counter++;
    if (_counter%2==1) {
         [self performSegueWithIdentifier:@"world" sender:self];
    }else{
         
    }
    NSLog(@"Long Press Detected");
   
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
