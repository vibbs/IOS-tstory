//
//  StoryCreate&Add.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "StoryCreate&Add.h"

@interface StoryCreate_Add ()

@property (nonatomic,retain) Storyline * sline;
@property (nonatomic,retain) StoryBook * thistory;
@property (nonatomic) NSUInteger countloc;
@property (nonatomic) NSUInteger countnam;


@end

@implementation StoryCreate_Add

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



- (IBAction)useLocation:(UISwitch *)sender {
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

- (IBAction)createStory:(id)sender {
    
    NSLog(@"createstroy clicked");
    NSString* sline = _storylineText.text;
    NSString* stitle = _titleText.text;
    NSString* scategory = _categoryText.text;
    NSString* slocation =_locationText.text;
    NSString* sname = _nameText.text;
    
    NSLog(@"%@", sline);
    NSLog(@"%@", stitle);
    NSLog(@"%@", scategory);
    NSLog(@"%@", slocation);
     NSLog(@"%@", sname);
    
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *storyLineDescription = [NSEntityDescription entityForName:@"Storyline" inManagedObjectContext:app.managedObjectContext];
    NSEntityDescription *storyBookDescription = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:app.managedObjectContext];
    
    NSManagedObject *thisStoryLine = [[NSManagedObject alloc] initWithEntity:storyLineDescription insertIntoManagedObjectContext:app.managedObjectContext];
    NSManagedObject *thisStoryBook = [[NSManagedObject alloc] initWithEntity:storyBookDescription insertIntoManagedObjectContext:app.managedObjectContext];
    
    [thisStoryLine setValue:sline forKey:@"storyline"];
    [thisStoryLine setValue:sname forKey:@"user"];
    [thisStoryLine setValue:slocation forKey:@"location"];
    //have to check out how to add object
    
    //TO_DO have to implement story image file storage
    
   
    
    [thisStoryBook setValue:stitle forKey:@"title"];
    [thisStoryBook setValue:sname forKey:@"createrUser"];
    [thisStoryBook setValue:slocation forKey:@"creatorLocation"];
    [thisStoryBook setValue:scategory forKey:@"category"];
    
    
    
    
    
   
    
    
    
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
