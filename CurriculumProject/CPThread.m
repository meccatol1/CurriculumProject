//
//  CPThread.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPThread.h"

@implementation CPThread

void observerCallBack2(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSLog(@"observerCallBack, activity = %zd", activity);
}

- (void)main {
    @autoreleasepool {
        NSLog(@"starting thread....... = %@", self);
        NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
        
        NSTimer *timer =
        [NSTimer timerWithTimeInterval:2
                                target:self
                              selector:@selector(doTimerTask)
                              userInfo:nil
                               repeats:NO]; // or YES
        [myRunLoop addTimer:timer forMode:NSDefaultRunLoopMode];
        
        CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
        CFRunLoopObserverRef    observer =
        CFRunLoopObserverCreate(kCFAllocatorDefault,
                                kCFRunLoopAllActivities, YES, 0, &observerCallBack2, &context);
        if (observer)
        {
            CFRunLoopRef    cfLoop = [myRunLoop getCFRunLoop];
            CFRunLoopAddObserver(cfLoop, observer, kCFRunLoopDefaultMode);
        }
        
        NSLog(@"mid thread");
        BOOL continueLoop = YES;
        while (![self isCancelled] && continueLoop) {
            [self doOtherTask];
            NSLog(@"in While");
            BOOL ret = [myRunLoop runMode:NSDefaultRunLoopMode
                               beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
            if (ret == NO) continueLoop = NO;
            NSLog(@"after runloop counting : %d", ret);
        }
        NSLog(@"finishing thread");
    }
}
- (void)doTimerTask {
    NSLog(@"* do timer task");
}
- (void)doOtherTask {
    NSLog(@"* do other task");
}

//- (void)main {
//    NSLog(@"CPThread main start, %@", [NSThread currentThread]);
//    
//    for (int i = 0; i < 10000; i++) {
////        @autoreleasepool {
//        NSLog(@"[%zd] for", i);
//        
//        int twentyMb           = 20971520;
//        NSMutableData *theData1 = [NSMutableData dataWithCapacity:twentyMb];
//        for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
//        {
//            u_int32_t randomBits = arc4random();
//            [theData1 appendBytes:(void*)&randomBits length:4];
//        }
//        NSMutableData *theData2 = [NSMutableData dataWithCapacity:twentyMb];
//        for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
//        {
//            u_int32_t randomBits = arc4random();
//            [theData2 appendBytes:(void*)&randomBits length:4];
//        }
//        
//        NSLog(@"[%zd] data1 size = %.2f MB", i, (double)(theData1.length/(1024.0f*1024.0f)));
//        NSLog(@"[%zd] data2 size = %.2f MB", i, (double)(theData2.length/(1024.0f*1024.0f)));
//        //        }
//    }
//    NSLog(@"CPThread main end, %@", [NSThread currentThread]);
//}

//- (void)main {
//    NSLog(@"CPThread main start, %@", [NSThread currentThread]);
//    NSLog(@"CPThread priority = %f", self.threadPriority);
//    for (int i = 0; i < 3; i++) {
//        NSLog(@"CPThread i = %zd, %@", i, [NSThread currentThread]);
//    }
//    NSLog(@"CPThread main end, %@", [NSThread currentThread]);
//}

- (void)threadMainRoutine
{
    @autoreleasepool {
        BOOL moreWorkToDo = YES;
        BOOL exitNow = NO;
        NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
        
        NSMutableDictionary* threadDict = [[NSThread currentThread] threadDictionary];
        [threadDict setValue:[NSNumber numberWithBool:exitNow] forKey:@"ThreadShouldExitNow"];
        
//        [self myInstallCustomInputSource];
        
        while (moreWorkToDo && !exitNow)
        {
            // Do one chunk of a larger body of work here.
            // Change the value of the moreWorkToDo Boolean when done.
            
            // Run the run loop but timeout immediately if the input source isn't waiting to fire.
            [runLoop runUntilDate:[NSDate date]];
            
            // Check to see if an input source handler changed the exitNow value.
            exitNow = [[threadDict valueForKey:@"ThreadShouldExitNow"] boolValue];
        }
    }
}

//void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
//void RunLoopSourcePerformRoutine (void *info);
//void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode);
//
//- (void)myInstallCustomInputSource {
//    CFRunLoopSourceContext context = {0, (__bridge void *)self,
//        NULL, NULL, NULL, NULL, NULL,
//        &RunLoopSourceScheduleRoutine,
//        RunLoopSourceCancelRoutine,
//        RunLoopSourcePerformRoutine};
//    
//    CFRunLoopSourceRef runLoopSource = CFRunLoopSourceCreate(NULL, 0, &context);
//    CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
//    CFRunLoopAddSource(runLoop, runLoopSource, kCFRunLoopDefaultMode);
//    
//    //
//    CFRunLoopSourceSignal(runLoopSource);
//    CFRunLoopWakeUp(runLoop);
//}
//
//////    NSSocketPort
////NSPort* myPort = [NSMachPort port];
////[myPort setDelegate:self];
////
////[[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
//
//- (void)timerSetting {
//    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
//    
//    // Create and schedule the first timer.
//    NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
//    
//    NSTimer* myTimer = [[NSTimer alloc] initWithFireDate:futureDate
//                                                interval:0.1
//                                                  target:self
//                                                selector:@selector(myDoFireTimer1:)
//                                                userInfo:nil
//                                                 repeats:YES];
//    [myRunLoop addTimer:myTimer forMode:NSDefaultRunLoopMode];
//    
//    // Create and schedule the second timer.
//    [NSTimer scheduledTimerWithTimeInterval:0.2
//                                     target:self
//                                   selector:@selector(myDoFireTimer2:)
//                                   userInfo:nil
//                                    repeats:YES];
//}

@end
