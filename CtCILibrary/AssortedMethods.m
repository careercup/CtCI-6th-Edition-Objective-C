//
//  AssortedMethods.m
//  CtCILibrary
//
//  Created by admin on 05.07.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

#import "AssortedMethods.h"

@implementation AssortedMethods

+ (NSArray <NSString *>*)stringArrayForString:(NSString *)string {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[string length]];

    for (int i = 0; i < [string length]; i++) {
        NSString *charStr = [string substringWithRange:NSMakeRange(i, 1)];
        [result addObject:charStr];
    }

    return result;
}

@end
