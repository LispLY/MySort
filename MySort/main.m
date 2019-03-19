//
//  main.m
//  MySort
//
//  Created by LuLouie on 2018/9/7.
//  Copyright © 2018年 llvm.xyz. All rights reserved.
//

#import "Header.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int *array = randomArrayWithLength(kArrayLength);
        
        int displayLength = kArrayLength>20?20:kArrayLength;
        
        for (int i=0; i<displayLength; i++) {
            printf("%d ",array[i]);
        }
        printf("\n");
        tick();
        array = quickSortFromBook(array, kArrayLength);
        tock();
        for (int i=0; i<displayLength; i++) {
            printf("%d ",array[i]);
        }
        printf("\n");

    }
    return 0;
}
