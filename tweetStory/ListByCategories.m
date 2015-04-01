//
//  ListByCategories.m
//  tweetStory
//
//  Created by Doddihal, Vaibhav A on 3/25/15.
//  Copyright (c) 2015 edu.newhaven.ios.doddihal. All rights reserved.
//

#import "ListByCategories.h"


@interface ListByCategories ()

@property (nonatomic, retain) NSArray * arr;
@property (nonatomic,retain) NSArray * clean;
@property (nonatomic,retain) NSMutableArray * unq;
@property (nonatomic,retain) NSString * str;

@end

@implementation ListByCategories

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"Entered listby category");
   
    
    
    
    //_arr = [[NSMutableArray alloc] initWithObjects:@"Horror",@"Romance",@"Thriller", @"Scifi", nil];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StoryBook" inManagedObjectContext:app.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *err = nil;
    _arr = [app.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    
    NSLog(@"%@", [[_arr lastObject] valueForKey:@"category"]);
    
    _unq = [[NSMutableArray alloc] init];
    _str = [[NSString alloc ] init];
    
    for (int i=0; i<[_arr count]; i++) {
        _str = [[_arr objectAtIndex:i] valueForKey:@"category"];
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
    
    [self print];
  

    
}

-(void) print{
    for (int i=0; i<[_clean count]; i++) {
        
        NSLog(@"clean code");
        
        NSLog(@"**********************************************************");
        NSLog(@"%@", [_clean objectAtIndex:i]);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self performSegueWithIdentifier:@"cat" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
    NSLog(@"seg entered");
    if([[segue identifier] isEqual:@"cat"]){
            NSLog(@"entered the if condition");
            ListStoryByCategoryType *vc = segue.destinationViewController;
            NSString *p = [_clean objectAtIndex:self.myTableView.indexPathForSelectedRow.row];
        
        NSLog(@"%@",p);
        
            vc.segValue = p;
        
        NSLog(@"%@",vc.segValue );
        }
}


@end
