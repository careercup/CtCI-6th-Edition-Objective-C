//
//  main.m
//  Q1-5
//
//  Created by admin on 15/07/2017.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//

// One Away:
// There are three types of edits that can be performed on strings: insert a character,
// remove a character, or replace a character. Given two strings, write a function
// to check if they are one edit (or zero edits) away.
// EXAMPLE
// pale, ple -> true
// pales, pale -> true
// pale, bale -> true
// pale, bake -> false
// pg 91


#import <Foundation/Foundation.h>


BOOL isOneEditAway(NSString *first, NSString *second) {
    /* Length check */
    if (abs((int)[first length] - (int)[second length]) > 1) {
        return NO;
    }
    
    /* Get shorter and longer string */
    NSString *shorterString = [first length] < [second length] ? first : second;
    NSString *longerString = [first length] < [second length] ? second : first;
    
    int indexForShorter = 0;
    int indexForLonger = 0;
    BOOL isDifferenceFound = NO;
    
    while ((indexForShorter < [shorterString length]) && (indexForLonger < [longerString length])) {
        if ([shorterString characterAtIndex:indexForShorter] != [longerString characterAtIndex:indexForLonger]) {
            /* Ensure that this is the first difference found */
            if (isDifferenceFound) {
                return NO;
            }
            
            isDifferenceFound = YES;
            
            if ([shorterString length] == [longerString length]) {
                /* On replace, move shorter pointer */
                indexForShorter++;
            }
        }
        else {
            /* If matching, move shorter pointer */
            indexForShorter++;
        }
        /* Always move pointer for longer string */
        indexForLonger++;
    }
    
    return YES;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray <NSArray *>*inputArray = @[@[@"pale", @"ple"],
                                           @[@"pales", @"pale"],
                                           @[@"pale", @"bale"],
                                           @[@"pale", @"bake"]];
        
        for (NSArray <NSString *>*pair in inputArray) {
            BOOL output = isOneEditAway(pair[0], pair[1]);
            
            NSLog(@"Input1: %@\nInput2: %@\nOutput: %@", pair[0], pair[1], output ? @"TRUE" : @"FALSE");
        }
    }
    
    return 0;
}
