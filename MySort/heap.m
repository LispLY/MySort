//
//  heap.m
//  MySort
//
//  Created by LuLouie on 2018/9/7.
//  Copyright © 2018年 llvm.xyz. All rights reserved.
//

#import "Header.h"

// a heap demo
// 入堆 出堆
// 出堆：从最后位置上滤，到顶为止
// 入堆：从顶部下滤到底部
//
typedef struct heap {
    int* array;
    int maxSize;
    int heapSize;
} _heap;

typedef _heap* heap;

heap createHeap(int maxSize);
void destroyHeap(heap aheap);
void clearHeap(heap aheap);

void input(heap aheap,int val);
int deleteMin(heap aheap);

int percolateUp(heap aheap,int index);
int percolateDown(heap aheap,int index);

#define leftChild(x) = (2*x+1)
#define rightChild(x) = (2*x+2)

heap createHeap(int maxSize) {
    heap aheap = malloc(sizeof(_heap));
    aheap->array = malloc(sizeof(int)*maxSize);
    aheap->heapSize=0;
    return aheap;
}

void destroyHeap(heap aheap) {
    if (!aheap) return;
    free(aheap->array);
    free(aheap);
}

void clearHeap(heap aheap) {
    if (!aheap) return;
    aheap->heapSize = 0;
}

//void input(heap aheap,int val) {
//    int index = percolateDown(aheap, val);
//    aheap->array[index] = val;
//}
//
//int deleteMin(heap aheap) {
//    int val = aheap->array[0];
//    percolateUp(aheap, 0);
//    return val;
//}





