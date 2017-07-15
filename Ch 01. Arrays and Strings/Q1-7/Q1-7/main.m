//
//  main.m
//  Q1-7
//
//  Created by admin on 15/07/2017.
//  Copyright © 2017 Alexey Golikov. All rights reserved.
//

// Rotate Matrix:
// Given an image represented by an NxN matrix, where each pixel in the image is
// 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in
// place?
// pg 91


#import <Foundation/Foundation.h>
#import "AssortedMethods.h"


static const int matrixNumberOfRows = 5;
static const int matrixNumberOfColumns = 5;

BOOL rotateMatrix(int **matrix, int numberOfRows, int numberOfColumns) {
    if (numberOfRows == 0 ||
        numberOfRows != numberOfColumns) {
        return NO;
    }
    
    int matrixSize = numberOfRows;
    
    for (int layer = 0; layer < matrixSize/2; layer++) {
        int first = layer;
        int last = matrixSize - 1 - layer;
        
        for (int i = first; i < last; i++) {
            int offset = i - first;
            // save top
            int top = matrix[first][i];
            
            // left -> top
            matrix[first][i] = matrix[last - offset][first];
            
            // bottom -> left
            matrix[last - offset][first] = matrix[last][last - offset];
            
            // right -> bottom
            matrix[last][last - offset] = matrix[i][last];
            
            // top -> right
            matrix[i][last] = top;
        }
    }
    
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int **matrix = MakeIntMatrix(matrixNumberOfRows, matrixNumberOfColumns);
        [AssortedMethods randomMatrix:matrix
                         numberOfRows:matrixNumberOfRows
                      numberOfColumns:matrixNumberOfColumns
                                  min:1
                                  max:9];
        [AssortedMethods printMatrix:matrix
                        numberOfRows:matrixNumberOfRows
                     numberOfColumns:matrixNumberOfColumns];
        
        rotateMatrix(matrix, matrixNumberOfRows, matrixNumberOfColumns);
        
        [AssortedMethods printMatrix:matrix
                        numberOfRows:matrixNumberOfRows
                     numberOfColumns:matrixNumberOfColumns];
        
        FreeIntMatrix(matrix, matrixNumberOfRows);
    }
    return 0;
}
