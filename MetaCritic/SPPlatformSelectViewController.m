//
//  SPPlatformSelectViewController.m
//  BlogReader
//
//  Created by Sam Piggott on 11/03/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import "SPPlatformSelectViewController.h"
#import "TableViewController.h"
#import "MBProgressHUD.h"

@interface SPPlatformSelectViewController ()

@end

@implementation SPPlatformSelectViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tabBarController.tabBar setHidden:NO];
    
    // Get View
//    
//    TableViewController *TableViewController = [TableViewController initWithNibName:@"TableViewController" bundle:nil];
    
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"metacritic-logo"]]];
    
    // Platforms Array
    
    self.platforms = @[@"Xbox 360", @"PS3", @"PS4", @"Xbox One", @"PC", @"iOS", @"PS Vita", @"3DS", @"Wii U"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIImage *backgroundImage = [UIImage imageNamed:@"navBar"];
    
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.platforms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlatformCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.platforms[indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"platformSegue"]) {
    
    // Initiate instance variable of an index path
        
    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
    NSString *selectedPlatform = self.platforms[indexpath.row];
        
        if ([selectedPlatform isEqualToString:@"Wii U"]) {
        
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/58du04cs?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"wiiu"];
        
        }
        
        if ([selectedPlatform isEqualToString:@"iOS"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/6sdqt8zu?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"ios"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"PC"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/6y6egjic?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"pc"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"PS Vita"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/a6tezdb2?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"psvita"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"3DS"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/6l1eiauk?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"3ds"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"Xbox 360"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/cd75nv3q?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"xbox360"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"PS3"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/8u2cgcci?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"ps3"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"Xbox One"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/85c7w524?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"xboxone"];
            
        }
        
        if ([selectedPlatform isEqualToString:@"PS4"]) {
            
            [segue.destinationViewController setSelectedPlatform:@"http://www.kimonolabs.com/api/ddz8w6mg?apikey=cca078a9b76b5770da7f4fd13c968b1a"];
            [segue.destinationViewController setPlatformTitle:@"ps4"];
            
        }
        
    }
    
}



@end
