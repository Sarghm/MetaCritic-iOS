//
//  SPFilterResultsController.m
//  BlogReader
//
//  Created by Sam Piggott on 30/03/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import "SPFilterResultsController.h"

@implementation SPFilterResultsController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    // Set cells from array on first load [maybe in viewWillAppear?]
    
    self.filterOptionsArray = @[@"A-Z", @"Z-A", @"Highest Score to Lowest Score", @"Lowest Score to Highest Score"];
    
    // When a cell is tapped, pop view controller off the top
    
    // Set a property to the selected NSSortDescriptor
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.filterOptionsArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.textLabel.text = self.filterOptionsArray[indexPath.row];
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedItem = self.filterOptionsArray[indexPath.row];
    
    if ([selectedItem isEqualToString:@"A-Z"]) {
        self.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    }
    else if ([selectedItem isEqualToString:@"Z-A"]) {
        self.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
    }
    else if ([selectedItem isEqualToString:@"Highest Score to Lowest Score"]) {
        self.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
    }
    else if ([selectedItem isEqualToString:@"Lowest Score to Highest Score"]) {
        self.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:YES];
    }
    
    [self performSegueWithIdentifier:@"unwindToTableView" sender:self];
    
}



@end
