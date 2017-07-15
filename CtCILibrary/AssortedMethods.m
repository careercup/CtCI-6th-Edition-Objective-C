//
//  AssortedMethods.m
//  CtCILibrary
//
//  Created by admin on 05.07.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//

#import "AssortedMethods.h"


int** MakeIntMatrix(int numberOfRows, int numberOfColumns) {
    int** result = (int**) malloc(numberOfRows*sizeof(int*));
    for (int i = 0; i < numberOfRows; i++) {
        result[i] = (int*) malloc(numberOfColumns*sizeof(int));
    }
    
    return result;
} 

void FreeIntMatrix(int** matrix, int numberOfRows) {
    for (int i = 0; i < numberOfRows; i++) {
        free(matrix[i]);
    }
    
    free(matrix);
}


@implementation AssortedMethods

+ (NSArray <NSString *>*)stringArrayForString:(NSString *)string {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[string length]];

    for (int i = 0; i < [string length]; i++) {
        NSString *charStr = [string substringWithRange:NSMakeRange(i, 1)];
        [result addObject:charStr];
    }

    return result;
}


+ (void)randomMatrix:(int **)matrix numberOfRows:(int)m numberOfColumns:(int)n min:(int)min max:(int)max {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            int value = [[self class] randomIntWithMin:min max:max];
            matrix[i][j] = value;
        }
    }
}


+ (int)randomIntWithMin:(int)min max:(int)max {
    return arc4random_uniform(max - min + 1) + min;
}


+ (void)printMatrix:(int **)matrix numberOfRows:(int)m numberOfColumns:(int)n {
    NSMutableString *resultString = [@"" mutableCopy];
    
    for (int i = 0; i < m; i++) {
        BOOL isLineBegins = YES;
        
        for (int j = 0; j < n; j++) {
            if (isLineBegins) {
                isLineBegins = NO;
            }
            else {
                [resultString appendString:@" "];
            }
            
            if ((matrix[i][j] < 10) && (matrix[i][j] > -10)) {
                [resultString appendString:@" "];
            }
            
            if ((matrix[i][j] < 100) && (matrix[i][j] > -100)) {
                [resultString appendString:@" "];
            }
            
            if (matrix[i][j] >= 0) {
                [resultString appendString:@" "];
            }
            
            [resultString appendFormat:@"%li", (long)matrix[i][j]];
        }
        
        [resultString appendString:@"\n"];
    }
    
    NSLog(@"\n%@", resultString);
}

@end
