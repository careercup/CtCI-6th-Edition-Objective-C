//
//  main.m
//  Q1-9
//
//  Created by admin on 16/07/2017.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//


// String Rotation:
// Assume you have a method isSubstring which checks if one word is a substring
// of another. Given two strings, s1 and s2, write code to check if s2 is a rotation
// of s1 using only one call to isSubstring (e.g., "waterbottle" is a rotation of
// "erbottlewat").
// pg 91


#import <Foundation/Foundation.h>


BOOL isRotation(NSString *s1, NSString *s2) {
    NSUInteger s1Length = [s1 length];
    NSUInteger s2Length = [s2 length];
    
    /* Check that s1 and s2 are equal length and not empty */
    if ((s1Length == s2Length) && (s1Length > 0)) {
        /* Concatenate s1 and s1 within new buffer */
        NSString *s1s1 = [NSString stringWithFormat:@"%@%@", s1, s1];
        
        return [s1s1 containsString:s2];
    }
    
    return NO;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputString1 = @"waterbottle";
        NSString *inputString2 = @"erbottlewat";
        
        BOOL output = isRotation(inputString1, inputString2);
        
        NSLog(@"\nInput: %@ and %@\nOutput: %@", inputString1, inputString2, output ? @"TRUE" : @"FALSE");

        inputString1 = @"waterbottle";
        inputString2 = @"erbottlexxx";
        
        output = isRotation(inputString1, inputString2);
        
        NSLog(@"\nInput: %@ and %@\nOutput: %@", inputString1, inputString2, output ? @"TRUE" : @"FALSE");
}
    return 0;
}
