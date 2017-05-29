//
//  CustomOperation.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 29..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation {
    NSUInteger _index;
    NSUInteger _total;
    
//    BOOL executing;
//    BOOL finished;
}

- (id)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        _index = index;
        _total = 1;
        
//        executing = NO;
//        finished = NO;
    }
    return self;
}
//- (void)start {
//    NSLog(@"start");
//    if ([self isCancelled]) {
//        [self willChangeValueForKey:@"isFinished"];
//        finished = YES;
//        [self didChangeValueForKey:@"isFinished"];
//        return;
//    }
//    
//    if ([self isConcurrent]) {
//        [self willChangeValueForKey:@"isExecuting"];
//        [NSThread detachNewThreadSelector:@selector(main)
//                                 toTarget:self
//                               withObject:nil];
//        executing = YES;
//        [self didChangeValueForKey:@"isExecuting"];
//    } else {
//        [self willChangeValueForKey:@"isExecuting"];
//        executing = YES;
//        [self didChangeValueForKey:@"isExecuting"];
//        
//        [self main];
//    }
//}
//
//- (BOOL)isExecuting {
//    return executing;
//}
//- (BOOL)isFinished {
//    return finished;
//}
//- (BOOL)isConcurrent {
//    return NO;
//}

- (void)main {
    for (int i = (int)_index; i < _index+_total; i++) {
        if ([self isCancelled]) {
            break;
        }
        NSLog(@"i = %zd, %@", i, [NSThread currentThread]);
    }
    
//    [self completion];
}

//- (void)completion {
//    [self willChangeValueForKey:@"isFinished"];
//    [self willChangeValueForKey:@"isExecuting"];
//    
//    executing = NO;
//    finished = YES;
//    
//    [self didChangeValueForKey:@"isExecuting"];
//    [self didChangeValueForKey:@"isFinished"];
//}


@end
