//
//  utils.c
//  MySort
//
//  Created by LuLouie on 2018/9/7.
//  Copyright © 2018年 llvm.xyz. All rights reserved.
//

#import "Header.h"

#pragma mark - tick tock
static NSDate *beginDate;
void tick() {
    beginDate = [NSDate date];
    NSLog(@"tick.\n");
}
NSTimeInterval tock() {
    NSDate *dt = [NSDate date];
    NSTimeInterval ti = [dt timeIntervalSinceDate:beginDate];
    NSLog(@"tock.\ntime:%f\n",ti);
    beginDate = dt;
    return ti;
}
#pragma mark - random array
int *randomArrayWithLength(int length) {
    int *array = malloc(sizeof(int)*length);
    for (int i=0; i<length; i++) {
        array[i] = arc4random_uniform(kMaxNum);
    }
    return array;
}
