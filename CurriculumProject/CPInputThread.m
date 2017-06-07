//
//  CPInputThread.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 7..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPInputThread.h"

@implementation CPInputThread


//// 예제 케이스 3, 반복 타이머
//void observerCallBack3(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
//    NSLog(@"******* observerCallBack, activity = %zd, %@", activity, [NSThread currentThread]);
//}
//
//- (void)main {
//    @autoreleasepool {
//        NSLog(@"starting thread = %@", self);
//        NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
//        
//        CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
//        CFRunLoopObserverRef    observer =
//        CFRunLoopObserverCreate(kCFAllocatorDefault,
//                                kCFRunLoopAllActivities, YES, 0, &observerCallBack3, &context);
//        if (observer)
//        {
//            CFRunLoopRef    cfLoop = [myRunLoop getCFRunLoop];
//            CFRunLoopAddObserver(cfLoop, observer, (__bridge CFStringRef)@"CustomLoopMode");
//        }
//        
//        NSTimer *timer = [NSTimer timerWithTimeInterval:1
//                                                 target:self
//                                               selector:@selector(timerHandler:)
//                                               userInfo:nil
//                                                repeats:YES];
//        [myRunLoop addTimer:timer forMode:@"CustomLoopMode"];
//        
//        int count = 1;
//        do {
//            NSLog(@"in doWhile");
//            
//            [myRunLoop runMode:@"CustomLoopMode" beforeDate:[NSDate distantFuture]];
//            
//            count--;
//        } while (count);
//        NSLog(@"finishing thread");
//    }
//}

    //[myRunLoop runMode:@"custom" beforeDate:[NSDate distantFuture]];
//            CFRunLoopAddObserver(cfLoop, observer, (__bridge CFStringRef)@"custom");

// 예제 케이스 1,2
void observerCallBack3(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSLog(@"******* observerCallBack, activity = %zd, %@", activity, [NSThread currentThread]);
    NSLog(@"currentRunLoop = %@", [NSRunLoop currentRunLoop]);
}

- (void)main {
    @autoreleasepool {
        NSLog(@"starting thread = %@", self);
        NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
        
        CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
        CFRunLoopObserverRef    observer =
        CFRunLoopObserverCreate(kCFAllocatorDefault,
                                kCFRunLoopAllActivities, YES, 0, &observerCallBack3, &context);
        if (observer)
        {
            CFRunLoopRef    cfLoop = [myRunLoop getCFRunLoop];
            CFRunLoopAddObserver(cfLoop, observer, kCFRunLoopDefaultMode);
        }
        
        int count = 1;
        do {
            NSLog(@"in doWhile");
//            if (count == 1) {
//                [self performSelector:@selector(selectorHandler)
//                           withObject:nil
//                           afterDelay:5];
//            } else {
//                [self performSelector:@selector(selectorHandler)
//                           withObject:nil
//                           afterDelay:1];
//            }
            [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(timerHandler:)
                                           userInfo:nil
                                            repeats:NO];
            [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
            
            count--;
        } while (count);
        NSLog(@"finishing thread");
    }
}

//[myRunLoop run];
//[myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//[myRunLoop runMode:NSDefaultRunLoopMode
//        beforeDate:[NSDate distantFuture]];

//        [NSTimer scheduledTimerWithTimeInterval:2
//                                         target:self
//                                       selector:@selector(timerHandler:)
//                                       userInfo:nil
//                                        repeats:YES];

//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                 beforeDate:[NSDate distantFuture]];

- (void)selectorHandler {
    NSLog(@"\tselectorHandler, %@", [NSThread currentThread]);
}
- (void)selectorHandler1 {
    NSLog(@"\tselectorHandler, %@", [NSThread currentThread]);
}
- (void)selectorHandler2 {
    NSLog(@"\tselectorHandler, %@", [NSThread currentThread]);
}
- (void)timerHandler:(NSTimer *)timer {
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    NSLog(@"\ttimerHandler, %@", [NSThread currentThread]);
}
- (void)timerHandler1:(NSTimer *)timer {
    NSLog(@"\ttimerHandler, %@", [NSThread currentThread]);
}

@end
