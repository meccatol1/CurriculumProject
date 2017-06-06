//
//  CPInputThread.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 7..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPInputThread.h"

@implementation CPInputThread

void observerCallBack3(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSLog(@"******* observerCallBack, activity = %zd, %@", activity, [NSThread currentThread]);
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
        
//        [NSTimer scheduledTimerWithTimeInterval:2
//                                         target:self
//                                       selector:@selector(timerHandler:)
//                                       userInfo:nil
//                                        repeats:YES];
        
        int count = 1;
        do {
            NSLog(@"in doWhile");
            [self performSelector:@selector(selectorHandler) withObject:nil afterDelay:0.45];
            [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(timerHandler:)
                                           userInfo:nil
                                            repeats:NO];
//            [NSThread sleepForTimeInterval:1];
            [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
//            [myRunLoop run];
            count--;
        } while (count);
        NSLog(@"finishing thread");
    }
}

- (void)selectorHandler {
    NSLog(@"\tselectorHandler");
}
- (void)timerHandler:(NSTimer *)timer {
    NSLog(@"\ttimerHandler");
}

@end
