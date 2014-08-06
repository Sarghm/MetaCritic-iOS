//
//  TableViewController.h
//  BlogReader
//
//  Created by Sam Piggott on 25/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *topBar;
@property (strong, nonatomic) NSString *selectedPlatform;
@property (strong, nonatomic) NSString *platformTitle;
@property (strong, nonatomic) NSMutableArray *filteredresults;
@property (strong, nonatomic) NSIndexPath *selectedFilteredIndexPath;
@property (strong, nonatomic) IBOutlet UISegmentedControl *resultsFilter;

@property (strong, nonatomic) NSSortDescriptor *sortDescriptor;

@property (strong, nonatomic) IBOutlet UIButton *filterButton;
@property (strong, nonatomic) IBOutlet UIPickerView *filterPicker;

//@property (strong, nonatomic) IBOutlet UILabel *prototypeCellScore;
//@property (strong, nonatomic) IBOutlet UILabel *prototypeCellTitle;
//@property (strong, nonatomic) IBOutlet UILabel *prototypeCellSubtitle;

- (void)performBlockInBackground:(void (^)())block;

-(IBAction)unwindToTableView:(UIStoryboardSegue *)unwindSegue;

@property (nonatomic, strong) NSMutableArray *titles;



@end
