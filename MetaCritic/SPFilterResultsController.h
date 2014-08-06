//
//  SPFilterResultsController.h
//  BlogReader
//
//  Created by Sam Piggott on 30/03/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPFilterResultsController : UITableViewController

@property (nonatomic, strong) NSArray *filterOptionsArray;

@property (nonatomic, strong) NSSortDescriptor *sortDescriptor;

@end
