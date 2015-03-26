//
//  StoryAdd.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/26/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "StoryAdd.h"

@interface StoryAdd ()

@property (nonatomic) NSUInteger countloc;
@property (nonatomic) NSUInteger countnam;

@end

@implementation StoryAdd

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _countloc = 0;
    _countnam = 0;
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

- (IBAction)useLocation:(id)sender {
    _countloc++;
    if (_countloc%2==0) {
        NSLog(@"@%lu",_countloc%2);
        _locationText.text  = @"UNKNOWN";
    }else
        _locationText.text  = @"Location";
}

- (IBAction)useName:(id)sender {
    _countnam++;
    if (_countnam%2==0) {
        _nameText.text = @"Anon";
    }else
        _nameText.text = @"Username";
}

- (IBAction)addStoryLine:(id)sender {
    NSLog(@"addstroy clicked");
    NSLog(_lbTitle.text);
    NSLog(_lbCategory.text);
    NSLog(_locationText.text);
    NSLog(_nameText.text);
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *storyLineDescription = [NSEntityDescription entityForName:@"Storyline" inManagedObjectContext:app.managedObjectContext];
    NSEntityDescription *storyBookDescription = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:app.managedObjectContext];
    
    NSManagedObject *thisStoryLine = [[NSManagedObject alloc] initWithEntity:storyLineDescription insertIntoManagedObjectContext:app.managedObjectContext];
    NSManagedObject *thisStoryBook = [[NSManagedObject alloc] initWithEntity:storyBookDescription insertIntoManagedObjectContext:app.managedObjectContext];
    
   
    
    
    
}
@end
