//
//  BlogPost.h
//  BlogReader
//
//  Created by Sam Piggott on 26/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *release_date;
@property (nonatomic, strong) NSNumber *score;
@property (nonatomic, strong) NSNumber *user_score;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *color;

// Method constructor definition: - (desired return) nameOfMethod(expected type of arguments)arguments;

-(UIColor *)getColor:(NSString *)color;

@end
