//
//  AssortedMethods.h
//  CtCILibrary
//
//  Created by admin on 05.07.16.
//  Copyright © 2016 Alexey Golikov. All rights reserved.
//


#import <Foundation/Foundation.h>


/**
 Allocates memory for 2D-matrix of type int with given number of rows and columns. Should be freed with FreeIntMatrix after using.
 */
int** MakeIntMatrix(int numberOfRows, int numberOfColumns);

/**
 Frees memory allocated with MakeIntMatrix.
 */
void FreeIntMatrix(int** matrix, int numberOfRows);


@interface AssortedMethods : NSObject

/**
 Returns @[@"a", @"b", @"c", @"d"] for @"abcd".
 */
+ (NSArray <NSString *>*)stringArrayForString:(NSString *)string;

/**
 Fills the matrix with random int numbers. Matrix should be preallocated with MakeIntMatrix.
 */
+ (void)randomMatrix:(int **)matrix numberOfRows:(int)m numberOfColumns:(int)n min:(int)min max:(int)max;

/**
 Returns a random int number.
 */
+ (int)randomIntWithMin:(int)min max:(int)max;

/**
 Prints the matrix with NSLog.
 */
+ (void)printMatrix:(int **)matrix numberOfRows:(int)m numberOfColumns:(int)n;
@end
