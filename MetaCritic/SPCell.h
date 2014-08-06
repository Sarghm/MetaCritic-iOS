//
//  SPCell.h
//  BlogReader
//
//  Created by Sam Piggott on 11/03/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *myCellTitle;
@property (strong, nonatomic) IBOutlet UILabel *myCellScore;
@property (strong, nonatomic) IBOutlet UILabel *myCellDate;


@end
