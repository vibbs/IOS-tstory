//
//  ListStoryByCategoryType.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "ListStoryByCategoryType.h"

@interface ListStoryByCategoryType ()


@property (nonatomic,retain ) NSString * cat;
@property (nonatomic, retain) NSArray * arr;
@property (nonatomic,retain) NSArray * clean;
@property (nonatomic,retain) NSMutableArray * unq;
@property (nonatomic,retain) NSString * str;

@end

@implementation ListStoryByCategoryType

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"Entered listby title");
    self.title = _segValue;
    NSLog(@"%@",_segValue);
    
    //_arr = [[NSMutableArray alloc] initWithObjects:@"story1",@"story2",@"story3", @"story4", nil];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *exactPredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"category", _segValue];
    
    [fetchRequest setPredicate:exactPredicate];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    _unq = [[NSMutableArray alloc] init];
    _str = [[NSString alloc ] init];
    
    for (int i=0; i<[_arr count]; i++) {
        _str = [[_arr objectAtIndex:i] valueForKey:@"title"];
        [_unq addObject:_str];
        NSLog(@"**********************************************************");
        NSLog(@"%@", _str);
        NSLog(@"**********************************************************");
        NSLog(@"Main arr");
        NSLog(@"%@", _arr);
        
    }
    NSLog(@"something");
    
    NSLog(@"**********************************************************");
    
    _clean = [[NSSet setWithArray:_unq] allObjects];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// Whole purpose of these three methods is to get the first response to UIResponder
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated  {
    [self resignFirstResponder];
    [super viewDidDisappear:animated];
}
// End of three methods

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Shake has started");
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Shake has ended");
        [self pickARandom];
    }
}

- (void)pickARandom {
    NSLog(@"Lets start picking a random story");
    NSLog(@"Here is how many stories we have %lu", (unsigned long)[_clean count]);
    
    int randomNumber = arc4random_uniform([_clean count] - 1);
    NSLog(@"Here is the random number that I picked %i", randomNumber);
    NSLog(@"This is the story that was selected %@", [_clean objectAtIndex:randomNumber]);
    
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[_clean objectAtIndex:randomNumber]
                                                          message:@"Read this one"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
    [myAlertView show];

}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_clean count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    // Configure the cell...
 [[cell textLabel] setText:[_clean objectAtIndex:indexPath.row]] ;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (IBAction)userSwipedLeft:(id)sender {
    NSLog(@"User Swiped Left");
    [self performSegueWithIdentifier:@"title" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"seg entered");
    if([[segue identifier] isEqual:@"title"]){
        NSLog(@"entered the if condition");
        ListStoryLine *vc = segue.destinationViewController;
        NSString *p = [_clean objectAtIndex:self.myTableView.indexPathForSelectedRow.row];
        
        NSLog(@"%@",p);
        
        vc.segValue = p;
        
        NSLog(@"%@",vc.segValue );
    }
}

-(IBAction)unwindtoline:(UIStoryboardSegue *)seg {
    StoryCreate_Add  *vc = seg.sourceViewController;
    
}


@end
