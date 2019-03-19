//
//  sort.m
//  MySort
//
//  Created by LuLouie on 2018/9/7.
//  Copyright © 2018年 llvm.xyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
#pragma mark - sort

 /* 插入排序：insertion O(n²)
 * i次遍历之后，前i个数是排好序的
 * 把第i+1个数插入拍好序的i个数中
 * 使用tmp替代两两交换，因为插入排序的每一道是将1个数放到合适的位置
 */
int* insertionSort(int* array,int length) {
    int tmp;
    for (int i=1; i<length; i++) {
        for (int j=i; j>0; j--) {
            tmp = array[j];
            if (tmp < array[j-1]) {
                array[j] = array[j-1];
                array[j-1]=tmp;
            } else {
                break;
            }
        }
    }
    return array;
}

int* betterInsertSort(int* array,int length) {
    int i,j,tmp;
    for (i=1; i<length; i++) {
        tmp = array[i];
        for (j=i; j>0; j--) {
            if (array[j-1] > tmp) {
                array[j] = array[j-1];
            } else {
                break;
            }
        }
        array[j]=tmp;
    }
    return array;
}

/* 冒泡排序：bubble sort
 * 每次获取一个最大数，把待排序数字-1。
 * 两两比较，把最大的数字向右移动。
 */
int *bubbleSort(int *array, int length) {
    int i,j,tmp;
    for (i=length-1; i>0; i--) {
        for (j=0; j<i; j++) {
            tmp = array[j];
            if (tmp > array[j+1]) {
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
//        printf("\npass%d: ",length - i);
//        for (int k=0; k<length; k++) {
//            printf(" %d", array[k]);
//        }
    }
    return array;
}


/* 快速排序：使用枢纽元pivot把待排序数组划分成两半：大于pivot的和小于pivot的
 * pivot选择：随机选择消耗大，选第一个怕已排序的输入。选中间的，或者3个元素的中间值。
 */


void swap_(int *a, int *b) {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int midOf3(int *array, int begin, int end) {
    int mid = (begin+end)/2;
    if (&array[mid] < &array[begin]) {
        swap_(&array[mid], &array[begin]);
    }
    if (&array[mid] > &array[end]) {
        swap_(&array[mid], &array[end]);
    }
    if (&array[begin] > &array[end]) {
        swap_(&array[begin], &array[end]);
    }
    return mid;
}


void partition(int *array,int begin, int end) {
    if (end<=begin || !array) {
        return;
    }
//    int pivot = (begin+end)/2;
//    int pivot = midOf3(array, begin, end);
    int pivot = begin + arc4random()%(end-begin+1);
    
    swap_(&array[end], &array[pivot]);
    int small = begin-1;
    for (int i=begin; i<end; i++) {
        if (array[i]<array[end]) {
            small++;
            if (i!=small) {
                swap_(&array[small], &array[i]);
            }
        }
    }
    small++;
    swap_(&array[small], &array[end]);
    partition(array, begin, small-1);
    partition(array, small+1, end);
    
}


int* quickSortFromBook(int *array, int length) { // 使用中间数
    partition(array, 0, length-1);
    return array;
}




/* shell排序： shell sort 组间距逐渐缩小的交换排序
 * n = length/2 时，n个组，每个组length/n个元素。n缩小到1时，1个组，length个元素。
 * 以n为界对每隔n个数字排序，n逐渐减小，使用交换排序。
 */
int* shellSort(int *array,int length) { // 平方-1 增量
    int i,j,tmp;
    int n=2;
    while (n<length/2) {
        n<<=1;
    }
    n-=1;
    for (; n>0; n=(n+1)/2-1) {
        for (i=n; i<length; i++) { // 对间隔为n的组的完整排序
            tmp = array[i];
            for (j=i; j>=n; j-=n) { // j：遍历组内的每个数
                if (tmp<array[j-n]) {
                    array[j] = array[j-n];
                } else {
                    break;
                }
            }
            array[j] = tmp;
        }
    }
    
    return array;
}

int* oldShellSort(int *array,int length) { // n/2 增量
    int i,j,tmp;
    int n;
    for (n=length/2; n>0; n/=2) {
        for (i=n; i<length; i++) {
            tmp = array[i];
            for (j=i; j>=n; j-=n) {
                if (tmp<array[j-n]) {
                    array[j] = array[j-n];
                } else {
                    break;
                }
            }
            array[j] = tmp;
        }
    }
    return array;
}

/* 桶排 bucket sort
 * 每个可能的值一个坑，最后遍历辅助数组
 */

int *bucketSort(int *array, int length) {
    int *bucket = malloc(sizeof(int)*kMaxNum);
    memset(bucket, 0, sizeof(int)*kMaxNum);
    for (int i=0; i<length; i++) {
        bucket[array[i]] += 1;
    }
    int k = 0;
    for (int i=0; i<kMaxNum; i++) {
        int j = bucket[i];
        while (j--) {
            array[k++] = i;
        }
    }
    return array;
}


#pragma mark - lib qsort

int compare(const void *a, const void *b) {
    return *((int *)a)-*((int *)b);
}

int* libQSort(int *array,int size) {
    qsort((void *)array, kArrayLength, sizeof(int), compare);
//          int (* _Nonnull __compar)(const void *, const void *));
//
//    qsort(void *__base, size_t __nel, size_t __width,
//                   int (* _Nonnull __compar)(const void *, const void *));
    return array;
}

#pragma mark - merge sort

// 归并排序 分别排序然后选择大的
int* mergeS(int *array,int begin,int end,int *tmp) {
    
    return array;
}

int* mergeSort(int *array,int size) {
    int tmp[size];
    return mergeS(array,0,size-1,tmp);
}




