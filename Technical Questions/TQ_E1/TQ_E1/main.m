//
//  main.m
//  TQ_E1
//
//  Created by admin on 06.09.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

// VII. Technical Questions.
// Optimize & Solve Technique #1: Look BUD.
// Unnecessary Work.
// Print all positive integer solutions to the equation pow(a, 3) + pow(b, 3) == pow(c, 3) + pow(d, 3) where
// a, b, c, and d are integers between 1 and 1000.
// pg 68


#import <Foundation/Foundation.h>


static const NSInteger kCount = 100;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *startTime = [NSDate date];
        for (int a = 0; a < kCount; a++) {
            for (int b = 0; b < kCount; b++) {
                for (int c = 0; c < kCount; c++) {
                    for (int d = 0; d < kCount; d++) {
                        if ((pow(a, 3) + pow(b, 3)) == (pow(c, 3) + pow(d, 3))) {
                            NSLog(@"a = %@, b = %@, c = %@, d = %@", @(a), @(b), @(c), @(d));
                       }
                    }
                }
            }
        }
        NSLog(@"Solution 1, Execution time: %f", -[startTime timeIntervalSinceNow]);

        startTime = [NSDate date];
        for (int a = 0; a < kCount; a++) {
            for (int b = 0; b < kCount; b++) {
                for (int c = 0; c < kCount; c++) {
                    for (int d = 0; d < kCount; d++) {
                        if ((pow(a, 3) + pow(b, 3)) == (pow(c, 3) + pow(d, 3))) {
                            NSLog(@"a = %@, b = %@, c = %@, d = %@", @(a), @(b), @(c), @(d));
                            break;
                        }
                    }
                }
            }
        }
        NSLog(@"Solution 2, Execution time: %f", -[startTime timeIntervalSinceNow]);

        startTime = [NSDate date];
        for (int a = 0; a < kCount; a++) {
            for (int b = 0; b < kCount; b++) {
                for (int c = 0; c < kCount; c++) {
                    int d = cbrt(pow(a, 3) + pow(b, 3) - pow(c, 3));
                    if (d >= 0 && (pow(a, 3) + pow(b, 3)) == (pow(c, 3) + pow(d, 3))) {
                        NSLog(@"a = %@, b = %@, c = %@, d = %@", @(a), @(b), @(c), @(d));
                    }
                }
            }
        }
        NSLog(@"Solution 3, Execution time: %f", -[startTime timeIntervalSinceNow]);

        startTime = [NSDate date];
        NSMutableDictionary *valueMap = [@{} mutableCopy];
        for (int c = 0; c < kCount; c++) {
            for (int d = 0; d < kCount; d++) {
                int result = pow(c, 3) + pow(d, 3);
                if (!valueMap[@(result)]) {
                    NSMutableArray *list = [@[] mutableCopy];
                    valueMap[@(result)] = list;
                }
                [valueMap[@(result)] addObject:@[@(c), @(d)]];
            }
        }
        for (int a = 0; a < kCount; a++) {
            for (int b = 0; b < kCount; b++) {
                int result = pow(a, 3) + pow(b, 3);
                NSArray *list = valueMap[@(result)];
                for (NSArray *pair in list) {
                    NSLog(@"a = %@, b = %@, c = %@, d = %@", @(a), @(b), pair.firstObject, pair.lastObject);
                }
            }
        }
        NSLog(@"Solution 4, Execution time: %f", -[startTime timeIntervalSinceNow]);

        startTime = [NSDate date];
        valueMap = [@{} mutableCopy];
        for (int c = 0; c < kCount; c++) {
            for (int d = 0; d < kCount; d++) {
                int result = pow(c, 3) + pow(d, 3);
                if (!valueMap[@(result)]) {
                    NSMutableArray *list = [@[] mutableCopy];
                    valueMap[@(result)] = list;
                }
                [valueMap[@(result)] addObject:@[@(c),@(d)]];
            }
        }

        [valueMap enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *list, BOOL *stop) {
            for (NSArray *pair1 in list) {
                for (NSArray *pair2 in list) {
                    NSLog(@"a = %@, b = %@, c = %@, d = %@", pair1.firstObject, pair1.lastObject, pair2.firstObject, pair2.lastObject);
                }
            }
        }];

        NSLog(@"Solution 5, Execution time: %f", -[startTime timeIntervalSinceNow]);
    }

    return 0;
}
