//
//  main.m
//  Q1-1
//
//  Created by admin on 05.07.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

// Is Unique:
// Implement an algorithm to determine if a string has all unique characters. What
// if you cannot use additional data structures?
// pg 90


#import <Foundation/Foundation.h>


BOOL isUniqueChars1(NSString *string) {
    /* Assumes extended ASCII */
    if ([string length] > 256) {
        return NO;
    }

    bool char_set[256];
    memset(char_set, 0, 256);

    for (int i = 0; i < [string length]; i++) {
        int value = [string characterAtIndex:i];
        if (char_set[value]) {
            return NO;
        }

        char_set[value] = true;
    }

    return YES;
}


BOOL isUniqueChars2(NSString *string) {
    /* Assumes only letters a through z */
    if ([string length] > 26) {
        return NO;
    }

    int checker = 0;
    for (int i = 0; i < [string length]; i++) {
        int value = [string characterAtIndex:i] - 'a';
        if ((checker & (1 << value)) > 0) {
            return NO;
        }
        checker |= (1 << value);
    }

    return YES;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *words = @[@"abcde", @"hello", @"apple", @"kite", @"padle"];

        for (NSString *word in words) {
            NSLog(@"Input: %@, isUnique1: %@, isUnique2: %@",
                  word,
                  isUniqueChars1(word) ? @"TRUE" : @"FALSE",
                  isUniqueChars2(word) ? @"TRUE" : @"FALSE");
        }
    }

    return 0;
}
