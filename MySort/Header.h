//
//  Header.h
//  MySort
//
//  Created by LuLouie on 2018/9/7.
//  Copyright © 2018年 llvm.xyz. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define kArrayLength 1000
#define kMaxNum 10000000
#define kArrayLengthBak 100000
#define kMaxNumBak 10000000

#import <Foundation/Foundation.h>

void tick(void);
NSTimeInterval tock(void);

int *randomArrayWithLength(int length);

int* oldShellSort(int *array,int length);
int* shellSort(int *array,int length);
int* libQSort(int *array,int size);
int* betterInsertSort(int* array,int length);
int *bubbleSort(int *array, int length);
int* quickSortFromBook(int *array, int length);
int *bucketSort(int *array, int length);




#endif /* Header_h */
