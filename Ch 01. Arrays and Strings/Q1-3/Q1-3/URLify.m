//
//  URLify.m
//  Q1-3
//
//  Created by Ben Makusha on 3/28/17.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//

#import "URLify.h"

@implementation URLify

-(NSString*) replaceSpaces:(NSString *)str{
    
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *comps = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    comps = [comps filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
    str = [comps componentsJoinedByString:@"%20"];
    return str;
}

@end
