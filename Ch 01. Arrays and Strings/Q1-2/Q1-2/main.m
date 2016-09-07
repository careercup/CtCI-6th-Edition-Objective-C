//
//  main.m
//  Q1-2
//
//  Created by admin on 05.07.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

// Check Permutation:
// Given two strings, write a method to decide if one is a permutation of the other.
// pg 90


#import <Foundation/Foundation.h>

#import "AssortedMethods.h"


NSString *sort(NSString *string) {
    NSArray <NSString *> *charArray = [AssortedMethods stringArrayForString:string];
    NSArray <NSString *> *sortedCharArray = [charArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    return [sortedCharArray componentsJoinedByString:@""];
}


BOOL permutation1(NSString *s, NSString *t) {
    return [sort(s) isEqualToString:sort(t)];
}


BOOL permutation2(NSString *s, NSString *t) {
    if ([s length] != [t length]) {
        return NO;
    }

    /* Assumes extended ASCII */
    int letters[256];
    memset(letters, 0, 256 * sizeof(int));
    
    for (int i = 0; i < [s length]; i++) {
        int value = [s characterAtIndex:i];
        letters[value]++;
    }

    for (int i = 0; i < [t length]; i++) {
        int value = [t characterAtIndex:i];
        letters[value]--;
        if (letters[value] < 0) {
            return NO;
        }
    }

    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray <NSArray *>*pairs = @[@[@"apple", @"papel"],
                                      @[@"carrot", @"tarroc"],
                                      @[@"hello", @"llloh"],
                                      @[@"hello", @"helloo"]];
        for (NSArray *pair in pairs) {
            NSString *first = [pair firstObject];
            NSString *second = [pair lastObject];

            NSLog(@"%@, %@, permutation1: %@, permutation2: %@", first,
                  second,
                  permutation1(first, second) ? @"TRUE" : @"FALSE",
                  permutation2(first, second) ? @"TRUE" : @"FALSE");
        }
    }

    return 0;
}
