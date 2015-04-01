//
//  StoryLineDetail.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "StoryLineDetail.h"


@interface StoryLineDetail ()

@property (nonatomic,retain) NSArray * arr;
@property (nonatomic,retain) NSArray * sarr;
@property (nonatomic,retain) NSManagedObject * thisline;
@property (nonatomic,retain) NSManagedObject * thisstory;

@end

@implementation StoryLineDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _segValue;
    
    
    
    [self loaddata];
    //[self getCuser];

    [self refreshView];
}




-(void)loaddata{
    
    /**********************************************************************************/
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", _segValue];
    
    [fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    _thisline = [_arr lastObject];
    /**********************************************************************************/
    AppDelegate *sapp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *sfetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *sentity = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:sapp.managedObjectContext];
    [sfetchRequest setEntity:sentity];
    
    NSPredicate *sexactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", [_thisline valueForKey:@"title"]];
    
    [sfetchRequest setPredicate:sexactPredicate];
    
    NSError *serr = nil;
    _sarr = [sapp.managedObjectContext executeFetchRequest:sfetchRequest error:&serr];
    
    _thisstory = [_sarr lastObject];

}

-(void) refresh{
    CGRect rect = CGRectMake(0,0,75,75);
    UIGraphicsBeginImageContext( rect.size );
    _media =[UIImage imageWithData:[_thisline valueForKey:@"media"]];
    
    if (_media==NULL) {
        return;
    }else{
    [_media drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    [_set setImage:img];
    }
}


-(void)refreshView{
    
    [_lbtitle setText:[_thisline valueForKey:@"title"]];
    [_lbuser setText:[_thisline valueForKey:@"sname"]];
    [_lbsline setText:[_thisline valueForKey:@"sline"]];
    [_lbCuser setText:[_thisstory valueForKey:@"createrUser"]];
    
    NSLog(@"%@",[_thisline valueForKey:@"title"]);
     NSLog(@"%@",[_thisline valueForKey:@"sname"]);
     NSLog(@"%@",[_thisline valueForKey:@"sline"]);
     NSLog(@"%@", [_thisstory valueForKey:@"createrUser"]);
    
    [self refresh];
    
}

-(void)getCuser{
    
    NSLog(@"entered the get user func");
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Sline" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    
    
    
    NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", _segValue];
    
    [fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _sarr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
   
    
    _thisstory = [_sarr lastObject];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)postToFacebook:(id)sender {
    
    NSString * title = [_thisline valueForKey:@"title"];
    NSString * stry = [_thisline valueForKey:@"title"];
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"We can post a message to Facebook!");
        
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
     
        
        NSLog(@"Title: %@ \n Storyline:%@ \n-this is my story addition", title,stry);
        [vc setInitialText:(@"Hello my Facebook friends, \nTitle: %@ \n Storyline:%@ \n-this is my story addition #tweetStoryapp-IOS", title,stry)];
        //[vc addImage:<image here>]
        [self presentViewController:vc animated:YES completion:nil];
    }
    else {
        NSLog(@"We cannot post to Facebook");
         NSLog(@"Title: %@ \n Storyline:%@ \n-this is my story addition", title,stry);
    }
}

- (IBAction)sendATweet:(id)sender {
    
    NSString * title = [_thisline valueForKey:@"title"];
    NSString * stry = [_thisline valueForKey:@"title"];
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"We can send a tweet!");
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [vc setInitialText:(@"Hello my twitter friends,\nTitle: %@ \n Storyline: %@ \n-this is my story addition #tweetStoryapp-IOS", title,stry)];
        [self presentViewController:vc animated:YES completion:nil];
    }
    else {
        NSLog(@"We cannot send a tweet!");
         NSLog(@"Title: %@ \n Storyline:%@ \n-this is my story addition", title,stry);
    }
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
