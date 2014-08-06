//
//  TableViewController.m
//  BlogReader
//
//  Created by Sam Piggott on 25/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "SPWebViewController.h"
#import "MBProgressHUD.h"
#import "SPCell.h"
#import "SPFilterResultsController.h"

@interface TableViewController ()

@end

@implementation TableViewController

// ASYNCHRONOUS TASK MANAGEMENT: Run [self performBlockInBackground:{ BLOCK }]; to multithread

- (void)performBlockInBackground:(void (^)())block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        block();
    });
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    SPFilterResultsController *filterResultsController = [[SPFilterResultsController alloc] init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tabBarController.tabBar setHidden:TRUE];
    
    self.tableView.rowHeight = 69;
    self.searchDisplayController.searchResultsTableView.rowHeight = 69;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
    
    [self performBlockInBackground:^{
    
    NSURL *metacriticInfo = [[NSURL alloc] initWithString:self.selectedPlatform];
    
    NSData *metacriticJSONFeed = [[NSData alloc]initWithContentsOfURL:metacriticInfo];
    
    NSDictionary *metacriticJSONDictionary = [NSJSONSerialization JSONObjectWithData:metacriticJSONFeed options:0 error:nil];
    
    NSArray *metacriticJSONArray = [[metacriticJSONDictionary objectForKey:@"results"] objectForKey:self.platformTitle];
        
    self.titles = [NSMutableArray array];
        
    
    
    for (NSDictionary *bpDictionary in metacriticJSONArray) {
        BlogPost *myBlogPost = [[BlogPost alloc] init];

    // Check that the type is an NSString (not a null), and only accept it if it is
        
        if ([[[bpDictionary valueForKey:@"title"] valueForKey:@"text"] isKindOfClass:[NSString class]] ) {
            myBlogPost.title = [[bpDictionary valueForKey:@"title"] valueForKey:@"text"];
        }
        
        if ([[bpDictionary valueForKey:@"user-score"] isKindOfClass:[NSString class]] ) {
            myBlogPost.user_score = [bpDictionary valueForKey:@"user-score"];
        }
        
        if ([[bpDictionary valueForKey:@"score"] isKindOfClass:[NSString class]]) {
            if ([[bpDictionary valueForKey:@"score"] isEqualToString:@"tbd"]) {
                myBlogPost.score = 0;
            }
            else {
            myBlogPost.score = [bpDictionary valueForKey:@"score"];
            }
        }
        
        if ([[[bpDictionary valueForKey:@"title"] valueForKey:@"href"] isKindOfClass:[NSString class]]) {
            myBlogPost.url = [[bpDictionary valueForKey:@"title"] valueForKey:@"href"];
        }
    
    // Same for the Release Date. + Update Log: Validate DATE not STRING
        
        if ([[bpDictionary valueForKey:@"release-date"] isKindOfClass:[NSString class]]) {
            myBlogPost.release_date = [bpDictionary valueForKey:@"release-date"];
        }
        
        [self.titles addObject:myBlogPost];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [MBProgressHUD hideAllHUDsForView:self.view animated:TRUE];
        });

        }

        
//        [MBProgressHUD hideAllHUDsForView:self.view animated:TRUE];

        }];

    
}
         

//Search

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope {
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", searchText];
    NSArray *filteredArray = [self.titles filteredArrayUsingPredicate:searchPredicate];
    self.filteredresults = [NSMutableArray arrayWithArray:filteredArray];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        [self performSegueWithIdentifier:@"viewReview" sender:self];
        self.selectedFilteredIndexPath = indexPath;
        
    }
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
 
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}


    // NSURL --> NSData --> NSJSONSerialization --> NSDictionary + NSError

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    // If the view is the search results one, just display the amount of search results
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return self.filteredresults.count;
    }
    //Otherwise, show 'em all
    else {
        return self.titles.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell";
    
    /* Removed 'indexPath' line, messes up the search.
    UITableViewCell *cell =
     */
    
    SPCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[SPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    BlogPost *cellContents = [[BlogPost alloc] init];
    
    // Prepare Colors
    
    UIColor *green = [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0f];
    UIColor *amber = [UIColor colorWithRed:241/255.0f green:196/255.0f blue:15/255.0f alpha:1.0f];
    UIColor *red = [UIColor colorWithRed:231/255.0f green:76/255.0f blue:60/255.0f alpha:1.0f];
    UIColor *gray = [UIColor colorWithRed:127/255.0f green:140/255.0f blue:141/255.0f alpha:1.0f];
    
    UIColor *darkgreen = [UIColor colorWithRed:76/255.0f green:177/255.0f blue:105/255.0f alpha:1.0f];
    UIColor *darkamber = [UIColor colorWithRed:228/255.0f green:186/255.0f blue:24/255.0f alpha:1.0f];
    UIColor *darkred = [UIColor colorWithRed:218/255.0f green:71/255.0f blue:56/255.0f alpha:1.0f];
    
    
    self.searchDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // If search results are showing, show the appropriate cell contents.
    if (tableView == self.searchDisplayController.searchResultsTableView) {
    cellContents = self.filteredresults[indexPath.row];
    }
    // Otherwise, show 'em all
    else {
    cellContents = self.titles[indexPath.row];
    }
    
    if ([cellContents.score intValue] == 0) {
        cell.myCellScore.backgroundColor = gray;
        cell.backgroundColor = gray;
    }
    if ([cellContents.score intValue] < 35 && [cellContents.score intValue] > 0) {
        cell.myCellScore.backgroundColor = red;
        cell.backgroundColor = darkred;
    }
    if ([cellContents.score intValue] < 74 && [cellContents.score intValue] > 36) {
        cell.myCellScore.backgroundColor = amber;
        cell.backgroundColor = darkamber;
    }
    if ([cellContents.score intValue] < 100 && [cellContents.score intValue] > 75) {
        cell.myCellScore.backgroundColor = green;
        cell.backgroundColor = darkgreen;
    }
    
    // Set the Cell Contents
    cell.myCellTitle.text = cellContents.title;
    cell.myCellDate.text = [NSString stringWithFormat:@"Released: %@ - User Score: %@", cellContents.release_date, cellContents.user_score];
    
    // If the score is 0, replace the shown text with "TBD" - assuming it's not been reviewed yet (so far there are no legitimate 0 scores on MetaCritic - potentially fix this later down the line)
    if (cellContents.score == 0) {
        cell.myCellScore.text = @"TBD";
    }
    // Otherwise, just show the score
    else {
        cell.myCellScore.text = [[NSString alloc] initWithFormat:@"%@", cellContents.score];
    }
    
    // Color them up
    
    
    // Score to Number
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//    [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
//    NSNumber *numberScore
//    if (NSNumber *proxyScore = [NSNumber numb]cellContents.score > @50) {
//        
//    }
    
    // Return the cell! Alright, ready to rock!
    return cell;

}


#pragma mark - Navigation


-(IBAction)unwindToTableView:(UIStoryboardSegue *)unwindSegue {

    SPFilterResultsController *sourceViewController = unwindSegue.sourceViewController;
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sourceViewController.sortDescriptor, nil];
    
    [self.titles sortUsingDescriptors: sortDescriptors];
    [self.tableView reloadData];

}

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"viewReview"]) {
    // Pass object from indexpath's url to the segue
    // Set up new property on to the web view controller
    
    NSIndexPath *indexPath = [[NSIndexPath alloc] init];
    BlogPost *destinationBlogPost = [[BlogPost alloc] init];
        
        if ([self.searchDisplayController isActive] == true) {
         
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destinationBlogPost = self.filteredresults[indexPath.row];
            
        }
        
        else {
            
            indexPath = [self.tableView indexPathForSelectedRow];
            destinationBlogPost = self.titles[indexPath.row];
            
        }
        
//        THIS FETCHES DATA AND READS IT BACK. A library called hpple can help us read this and parse the HTML!
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:destinationBlogPost.url]];
//        NSLog(@"%@", data);
        
        
    
    // Destination View Controller's Release Date Property is now set to destinationblogpost's release date ->

//    [segue.destinationViewController setReleaseDate:destinationBlogPost.release_date];
    [segue.destinationViewController setGameTitle:destinationBlogPost.title];
//    [segue.destinationViewController setGameScore:destinationBlogPost.score];
    [segue.destinationViewController setGameURL:destinationBlogPost.url];
//    [segue.destinationViewController setGameImage:destinationBlogPost.image];
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}




@end