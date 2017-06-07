//
//  CPView3Controller.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView3Controller.h"

#import "CPThread.h"
#import "CPThread2.h"
#import "CPInputThread.h"

#include <assert.h>
#include <pthread.h>

@interface CPView3Controller ()

@end

@implementation CPView3Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self autoreleaseTest];
//    [self performSelectorInBackground:@selector(autoreleaseTest4) withObject:nil];
//    [self autoreleaseTest4];
#pragma mark - Thread
    
#pragma mark Creating Threads
    [self cocoaThread];
//    [NSThread detachNewThreadSelector:@selector(customMethod) toTarget:self withObject:nil];
//    [self customMethod];
//    CPThread *thread = [[CPThread alloc] init];
//    [thread start];

#pragma mark Creating POSIX Thread
//    [self posixThread];
}

//    [NSThread detachNewThreadSelector:@selector(customMethod) toTarget:self withObject:nil];
//    [self performSelectorInBackground:@selector(customMethod) withObject:nil];

- (void)cocoaThread {
//    NSLog(@"## Creating");
//    CPThread *thread = [[CPThread alloc] init];
////    [thread setThreadPriority:.8];
//    // defalut value 0.5
//    [thread start];
    
//    NSLog(@"## Creating");
//    CPInputThread *thread2 = [[CPInputThread alloc] init];
//    NSDateComponents *currentComp = [[NSCalendar currentCalendar] components:NSCalendarUnitNanosecond
//                                                                    fromDate:[NSDate date]];
//    NSUInteger nanoToSec = 1000000000;
//    [NSThread sleepForTimeInterval:((nanoToSec-currentComp.nanosecond)/(double)nanoToSec)];
//    [thread2 start];
//    NSLog(@"## end");
    
//    [NSThread detachNewThreadSelector:@selector(threadMain) toTarget:self withObject:nil];
    
    NSLog(@"## Creating");
    CPThread2 *thread2 = [[CPThread2 alloc] init];
    [thread2 start];
    NSLog(@"## end");
}

- (void)customMethod {
    NSLog(@"customMethod start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"[%zd] for", i);
        @autoreleasepool {
            for (int k = 0; k < 20000; k++) {
                UIImage *image = [UIImage imageNamed:@"kitten.jpg"];
                image = image;
            }
        }
        NSLog(@"[%zd] end", i);
    }
    NSLog(@"customMethod end, %@", [NSThread currentThread]);
}

- (void)autoreleaseTest {
    __strong NSString *st1;
    __weak NSString *st2;
    
    for (int i = 0; i < 2; i++) {
        NSLog(@"### start st1 = %@, st2 = %@", st1, st2);
        @autoreleasepool {
            NSString *tmSt1 =
            [NSString stringWithFormat:@"[<%zd> st1]", i];
            NSString *tmSt2 =
            [[NSString alloc] initWithFormat:@"[<%zd> st2]", i];
            NSLog(@"\ttmSt1 = %@, tmSt2 = %@", tmSt1, tmSt2);
            
            st1 = tmSt1;
            st2 = tmSt2;
            NSLog(@"### mid st1 = %@, st2 = %@", st1, st2);
        }
        NSLog(@"### end st1 = %@, st2 = %@", st1, st2);
        NSLog(@" ");
    }
}

- (void)autoreleaseTest2 {
    NSLog(@"autoreleaseTest2 start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"[%zd] for", i);
        @autoreleasepool {
            for (int k = 0; k < 20000; k++) {
                UIImage *image = [UIImage imageNamed:@"kitten.jpg"];
                image = image;
            }
        }
        NSLog(@"[%zd] end", i);
    }
    NSLog(@"autoreleaseTest2 end, %@", [NSThread currentThread]);
}

- (void)autoreleaseTest3 {
    NSLog(@"autoreleaseTest3 start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"[%zd] for", i);
        for (int k = 0; k < 20000; k++) {
            UIImage *image = [UIImage imageNamed:@"kitten.jpg"];
            image = image;
        }
        NSLog(@"[%zd] end", i);
    }
    NSLog(@"autoreleaseTest3 end, %@", [NSThread currentThread]);
}

- (void)autoreleaseTest4 {
    NSLog(@"autoreleaseTest4 start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"[%zd] for", i);
        __weak NSMutableData *customData = nil;
        for (int k = 0; k < 10000; k++) {
//            NSLog(@"customData = %@", customData);
            int twentyMb = 2000; // 20MB
            NSMutableData *theData1 = [[NSMutableData alloc] initWithCapacity:twentyMb];
            [NSMutableData dataWithCapacity:twentyMb];
//            NSLog(@"1");
            for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
            {
                u_int32_t randomBits = arc4random();
                [theData1 appendBytes:(void*)&randomBits length:4];
            }
//            NSLog(@"2");
//            NSLog(@"theData1 = %@", theData1);
            customData = theData1;
//            NSLog(@"customData = %@", customData);
        }
        NSLog(@"[%zd] end", i);
    }
    NSLog(@"autoreleaseTest4 end, %@", [NSThread currentThread]);
}

//- (void)customMethod {
//    NSLog(@"customMethod start, %@", [NSThread currentThread]);
//    
//    for (int i = 0; i < 10000; i++) {
//        //        @autoreleasepool {
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
//    NSLog(@"customMethod end, %@", [NSThread currentThread]);
//}
//- (void)customMethod {
//    NSLog(@"customMethod start, %@", [NSThread currentThread]);
//    for (int i = 0; i < 3; i++) {
//        NSLog(@"customMethod i = %zd, %@", i, [NSThread currentThread]);
//    }
//    NSLog(@"customMethod end, %@", [NSThread currentThread]);
//}

void observerCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSLog(@"observerCallBack, activity = %zd", activity);
//    NSLog(@"info = %@", info);
}
- (void)doFireTimer:(NSTimer *)timer {
    NSLog(@"doFireTimer = %@", timer);
}

- (void)threadMain
{
    NSLog(@"start threadMain");
    // The application uses garbage collection, so no autorelease pool is needed.
    NSRunLoop *myRunLoop = [NSRunLoop currentRunLoop];
//    CFRunLoopObserverCallBack
    // Create a run loop observer and attach it to the run loop.
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
    CFRunLoopObserverRef observer =
    CFRunLoopObserverCreate(kCFAllocatorDefault,
                            kCFRunLoopAllActivities, YES, 0, &observerCallBack, &context);
    
    if (observer)
    {
        CFRunLoopRef    cfLoop = [myRunLoop getCFRunLoop];
        CFRunLoopAddObserver(cfLoop, observer, kCFRunLoopDefaultMode);
    }
    
    // Create and schedule the timer.
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                   selector:@selector(doFireTimer:) userInfo:nil repeats:YES];
    
    NSInteger    loopCount = 3;
    do
    {
        NSLog(@"in doWhile = %zd", loopCount);
        // Run the run loop 10 times to let the timer fire.
        [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
        loopCount--;
    }
    while (loopCount);
    NSLog(@"end threadMain");
}

#pragma mark - POSIX methods
- (void)posixThread {
    NSLog(@"## Creating");
    LaunchThread();
    NSLog(@"## end");
}
void *PosixThreadMainRoutine(void* data)
{
    NSLog(@"Posix start, %@", [NSThread currentThread]);
    for (int i = 0; i < 3; i++) {
        NSLog(@"Posix i = %zd, %@", i, [NSThread currentThread]);
    }
    NSLog(@"Posix end, %@", [NSThread currentThread]);
    return NULL;
}
void LaunchThread()
{
    NSLog(@"**** start LaunchThread");
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
//    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    NSLog(@"**** before make posix thread");
    
    int threadError =
    pthread_create(&posixThreadID, &attr, &PosixThreadMainRoutine, NULL);
    NSLog(@"**** after make posix thread");
    returnVal = pthread_attr_destroy(&attr);
    NSLog(@"**** delete posix thread");
    assert(!returnVal);
    if (threadError != 0)
    {
        // Report an error.
    }
    pthread_join(posixThreadID, NULL);
    NSLog(@"**** end LaunchThread");
}

@end
