//
//  BlogPost.m
//  BlogReader
//
//  Created by Sam Piggott on 26/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

-(UIColor *)getColor:(NSString *)color {

    CIColor *tempcolor = [CIColor colorWithString:color];
    UIColor *generatedColor = [UIColor colorWithCIColor:tempcolor];
    
    return generatedColor;
}

@end
