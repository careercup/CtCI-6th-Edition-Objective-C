//
//  main.m
//  Q1-6
//
//  Created by admin on 15/07/2017.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//

// String Compression:
// Implement a method to perform basic string compression using the counts of repeated
// characters. For example, the string aabcccccaaa would become a2blc5a3. If the
// "compressed" string would not become smaller than the original string, your method
// should return the original string. You can assume the string has only uppercase
// and lowercase letters (a - z).
// pg 91


#import <Foundation/Foundation.h>


int lengthOfCompressedStringForString(NSString *inputString) {
    int compressedLength = 0;
    int countConsecutive = 0;
    
    for (int i = 0; i < [inputString length]; i++) {
        countConsecutive++;
        
        /* If next character is different than current, increase the length */
        if ((i + 1 >= [inputString length]) ||
            ([inputString characterAtIndex:i] != [inputString characterAtIndex:i+1])) {
            compressedLength += 1 + [@(countConsecutive) stringValue].length;
            countConsecutive = 0;
        }
    }
    
    return compressedLength;
}


NSString *compressedStringForString(NSString *inputString) {
    /* Check final length and return input string if it would be longer */
    int finalLength = lengthOfCompressedStringForString(inputString);
    if (finalLength >= [inputString length]) {
        return inputString;
    }
    
    NSMutableArray *compressedStringArray = [[NSMutableArray alloc] initWithCapacity:finalLength];
    int countConsecutive = 0;
    
    for (int i = 0; i < [inputString length]; i++) {
        countConsecutive++;
        /* If next character is different than current, append this char to result */
        if ((i + 1 >= [inputString length]) ||
            ([inputString characterAtIndex:i] != [inputString characterAtIndex:i+1])) {
            [compressedStringArray addObject:[inputString substringWithRange:NSMakeRange(i, 1)]];
            [compressedStringArray addObject:[@(countConsecutive) stringValue]];
            countConsecutive = 0;
        }
    }
    
    return [compressedStringArray componentsJoinedByString:@""];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray <NSString *>*inputArray = @[@"aabcccccaaa",
                                           @"abcd",
                                           @"abbcd",
                                           @"aabbccdd",
                                           @"aabbacdd"];
        
        for (NSString *inputString in inputArray) {
            NSString *outputString = compressedStringForString(inputString);
            
            NSLog(@"Input: %@\nOutput: %@", inputString, outputString);
        }
    }
    
    return 0;
}
