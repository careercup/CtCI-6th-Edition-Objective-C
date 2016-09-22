//
//  main.m
//  Q1-4
//
//  Created by admin on 08.09.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

// Palindrome Permutation:
// Given a string, write a function to check if it is a permutation of a palin­drome.
// A palindrome is a word or phrase that is the same  rwards and backwards. A permutation
// is a rearrangement of letters. The palindrome does not need to be limited to just
// dictionary words.
// EXAMPLE
// Input: Tact Coa
// Output: True (permutations: "taco cat", "atco eta", etc.)
// pg 91


#import <Foundation/Foundation.h>


#pragma mark - Solution #1

int getCharNumber(unichar character) {
    if ('a' <= character && character <= 'z') {
        return character - 'a';
    }
    else if ('A' <= character && character <= 'Z') {
        return character - 'A';
    }

    return -1;
}


int *buildCharFrequencyTable(NSString *string) {
    int tableLength = ('z' - 'a' + 1) + ('Z' - 'A' + 1);
    int *result = (int *)malloc(tableLength * sizeof(int));
    memset(result, 0, tableLength * sizeof(int));

    for (int i = 0; i < [string length]; i++) {
        int x = getCharNumber([string characterAtIndex:i]);
        if (x != -1) {
            result[x]++;
        }
    }

    return result;
}


BOOL checkMaxOneOdd(int *table) {
    BOOL foundOdd = NO;
    int tableLength = ('z' - 'a' + 1) + ('Z' - 'A' + 1);

    for (int i = 0; i < tableLength; i++) {
        if (table[i] % 2 == 1) {
            if (foundOdd) {
                return NO;
            }

            foundOdd = YES;
        }
    }

    return YES;
}


BOOL isPermutationOfPalindrome1(NSString *string) {
    int *table = buildCharFrequencyTable(string);

    return checkMaxOneOdd(table);
}


#pragma mark - Solution #2

BOOL isPermutationOfPalindrome2(NSString *string) {
    int countOdd = 0;

    int tableLength = ('z' - 'a' + 1) + ('Z' - 'A' + 1);
    int *table = (int *)malloc(tableLength * sizeof(int));
    memset(table, 0, tableLength * sizeof(int));

    for (int i = 0; i < [string length]; i++) {
        int x = getCharNumber([string characterAtIndex:i]);
        if (x != -1) {
            table[x]++;
            if (table[x] % 2 == 1) {
                countOdd++;
            }
            else {
                countOdd--;
            }
        }
    }

    return countOdd <= 1;
}


#pragma mark - Solution #3

int toggle(int bitVector, int index) {
    if (index < 0) {
        return bitVector;
    }

    int mask = 1 << index;

    if ((bitVector & mask) == 0) {
        bitVector |= mask;
    }
    else {
        bitVector &= ~mask;
    }

    return bitVector;
}


int createBitVector(NSString *string) {
    int result = 0;
    for (int i = 0; i < [string length]; i++) {
        int x = getCharNumber([string characterAtIndex:i]);
        result = toggle(result, x);
    }

    return result;
}


BOOL checkExactlyOneBitSet(int bitVector) {
    return (bitVector & (bitVector - 1)) == 0;
}


BOOL isPermutationOfPalindrome3(NSString *string) {
    int bitVector = createBitVector(string);

    return bitVector == 0 || checkExactlyOneBitSet(bitVector);
}


#pragma mark -

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString = @"Tact Coa";

        BOOL result1 = isPermutationOfPalindrome1(inputString);

        NSLog(@"Solution 1:\nInput: %@\nOutput: %@", inputString, result1 ? @"True" : @"False");

        BOOL result2 = isPermutationOfPalindrome2(inputString);

        NSLog(@"Solution 2:\nInput: %@\nOutput: %@", inputString, result2 ? @"True" : @"False");

        // This solution works only for lower case strings
        BOOL result3 = isPermutationOfPalindrome3([inputString lowercaseString]);

        NSLog(@"Solution 3:\nInput: %@\nOutput: %@", inputString, result3 ? @"True" : @"False");
    }
    
    return 0;
}
