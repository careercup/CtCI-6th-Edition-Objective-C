//
//  main.m
//  Q1-8
//
//  Created by admin on 16/07/2017.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//

// Zero Matrix:
// Write an algorithm such that if an element in an MxN matrix is 0, its entire
// row and column are set to 0
// pg 91


#import <Foundation/Foundation.h>
#import "AssortedMethods.h"


static const int kMatrixNumberOfRows = 6;
static const int kMatrixNumberOfColumns = 6;


void nullifyRow(int **matrix, int numberOfColumns, int row) {
    for (int i = 0; i < numberOfColumns; i++) {
        matrix[row][i] = 0;
    }
}


void nullifyColumn(int **matrix, int numberOfRows, int column) {
    for (int i = 0; i < numberOfRows; i++) {
        matrix[i][column] = 0;
    }
}


void setZeros(int **matrix, int numberOfRows, int numberOfColumns) {
    BOOL hasFirstRowZero = NO;
    BOOL hasFirstColumnZero = NO;
    
    // Check if the first row has a zero
    for (int i = 0; i < numberOfColumns; i++) {
        if (matrix[0][i] == 0) {
            hasFirstRowZero = YES;
            break;
        }
    }
    
    // Check if the first column has a zero
    for (int i = 0; i < numberOfRows; i++) {
        if (matrix[i][0] == 0) {
            hasFirstColumnZero = YES;
            break;
        }
    }
    
    // Check for zeros in the rest of the array
    for (int i = 1; i < numberOfColumns; i++) {
        for (int j = 1; j < numberOfRows; j++) {
            if (matrix[i][j] == 0) {
                matrix[i][0] = 0;
                matrix[0][j] = 0;
            }
        }
    }
    
    // Nullify rows based on values in the first column
    for (int i = 0; i < numberOfRows; i++) {
        if (matrix[i][0] == 0) {
            nullifyRow(matrix, numberOfColumns, i);
        }
    }

    // Nullify columns based on values in the first row
    for (int i = 0; i < numberOfColumns; i++) {
        if (matrix[0][i] == 0) {
            nullifyColumn(matrix, numberOfRows, i);
        }
    }
    
    // Nullify the first row
    if (hasFirstRowZero) {
        nullifyRow(matrix, numberOfColumns, 0);
    }

    // Nullify the first column
    if (hasFirstColumnZero) {
        nullifyColumn(matrix, numberOfRows, 0);
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int **matrix = MakeIntMatrix(kMatrixNumberOfRows, kMatrixNumberOfColumns);
        [AssortedMethods randomMatrix:matrix
                         numberOfRows:kMatrixNumberOfRows
                      numberOfColumns:kMatrixNumberOfColumns
                                  min:0
                                  max:5];
        [AssortedMethods printMatrix:matrix
                        numberOfRows:kMatrixNumberOfRows
                     numberOfColumns:kMatrixNumberOfColumns];
        
        setZeros(matrix, kMatrixNumberOfRows, kMatrixNumberOfColumns);
        
        [AssortedMethods printMatrix:matrix
                        numberOfRows:kMatrixNumberOfRows
                     numberOfColumns:kMatrixNumberOfColumns];
        
        FreeIntMatrix(matrix, kMatrixNumberOfRows);
    }
    return 0;
}
