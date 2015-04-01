//
//  ManageStory.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "ManageStory.h"


@interface ManageStory ()
@property (nonatomic,retain) NSArray * arr;
@property (nonatomic,retain) NSManagedObject * thisline;

@end

@implementation ManageStory

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _segValue;
    
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    
    
    
    NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", _segValue];
    
    [fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    [self refreshView];
    
}

-(void)refreshView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)postToFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"We can post a message to Facebook!");
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [vc setInitialText:@"Hello my Facebook friends, Checkout my story at #tweetstoryapp-IOS"];
        //[vc addImage:<image here>]
        [self presentViewController:vc animated:YES completion:nil];
    }
    else {
        NSLog(@"We cannot post to Facebook");
    }
}

- (IBAction)sendATweet:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"We can send a tweet!");
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [vc setInitialText:@"Hello my twitter friends, Checkout my story at #tweetstoryapp-IOS"];
        [self presentViewController:vc animated:YES completion:nil];
    }
    else {
        NSLog(@"We cannot send a tweet!");
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"seg entered");
    if([[segue identifier] isEqual:@"add"]){
        NSLog(@"entered the if condition");
        StoryAdd *vc = segue.destinationViewController;
       
        
        vc.segValue = _segValue;
        
        NSLog(@"%@",vc.segValue );
    }
}


@end
