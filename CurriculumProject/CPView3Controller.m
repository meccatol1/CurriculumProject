//
//  CPView3Controller.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <libkern/OSAtomic.h>
#import "CPView3Controller.h"

#import "CPThread.h"
#import "CPThread2.h"
#import "CPInputThread.h"

#include <assert.h>
#include <pthread.h>

@interface CPView3Controller ()

@property (atomic) NSInteger total;
@property (atomic) NSInteger testTotal;

@property (strong) NSLock *lock;

@property (strong) NSRecursiveLock *recursiveLock;

@property (strong) NSConditionLock *conditionLock;
@property (strong) NSMutableArray *dataArray;

@end

@implementation CPView3Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - Synchronization
    
#pragma mark NSLock
    self.lock = [[NSLock alloc] init];
    
    [self testThreadSafety];
    
//    self.recursiveLock = [NSRecursiveLock new];
//    dispatch_queue_t global =
//    dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//    dispatch_async(global, ^{
//        NSLog(@"#### start 1");
//        [self recursiveMethod1:5];
//        NSLog(@"#### end 1");
//    });
//    dispatch_async(global, ^{
//        NSLog(@"#### start 2");
//        [self recursiveMethod2:5];
//        NSLog(@"#### end 2");
//    });
    
//    self.conditionLock =
//    [[NSConditionLock alloc] initWithCondition:10];
//    self.dataArray = [NSMutableArray array];
//    dispatch_queue_t global =
//    dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//    dispatch_async(global, ^{
//        NSLog(@"#### Consumer start 1");
//        [self consumer1];
//        NSLog(@"#### Consumer end 1");
//    });
//    dispatch_async(global, ^{
//        NSLog(@"#### Consumer start 2");
//        [self consumer2];
//        NSLog(@"#### Consumer end 2");
//    });
//    dispatch_async(global, ^{
//        NSLog(@"#### Producer start");
//        [self producer];
//        NSLog(@"#### Producer end");
//    });
    
    
#pragma mark Atomic operation;
//    self.total = 1000;
//    self.testTotal = self.total;
//    int totalLoop = 5000;
//    NSLog(@"**** start total = %zd, with Loop count = %zd", self.total, totalLoop);
//    dispatch_queue_t global = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//    
//    for (int i = 0; i < totalLoop; i++) {
////        NSNumber *isLast = [NSNumber numberWithBool:(i==(totalLoop-1)?YES:NO)];
//        int whether = arc4random()%2;
//        if (whether == 0) {
//            
//            dispatch_async(global, ^{
//                [self increaseTotal];
//            });
//            self.testTotal++;
//        } else {
//            dispatch_async(global, ^{
//                [self decreaseTotal];
//            });
//            self.testTotal--;
//        }
//        
////        if (whether == 0) {
////            dispatch_async(global, ^{
////                @synchronized (self) {
////                    self.total++;
////                }
////            });
////            self.testTotal++;
////        } else {
////            dispatch_async(global, ^{
////                @synchronized (self) {
////                    self.total--;
////                }
////            });
////            self.testTotal--;
////        }
////        if (whether == 0) {
////            dispatch_async(global, ^{
////                self.total++;
////            });
////            self.testTotal++;
////        } else {
////            dispatch_async(global, ^{
////                self.total--;
////            });
////            self.testTotal--;
////        }
//    }
//    dispatch_barrier_async(global, ^{
//        NSLog(@"**** End");
//        NSLog(@"total = %zd", self.total);
//        NSLog(@"testTotal = %zd", self.testTotal);
//    });
    
//    [self performSelector:@selector(checkTotal) withObject:nil afterDelay:4];
    
    
    // Do any additional setup after loading the view.
//    [self autoreleaseTest];
//    [self performSelectorInBackground:@selector(autoreleaseTest4) withObject:nil];
//    [self autoreleaseTest4];
#pragma mark - Thread
    
    
#pragma mark Creating Threads
//    [self cocoaThread];
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

#pragma mark - Synchoronization Methods

- (void)testThreadSafety {
    self.total = 1000;
    self.testTotal = self.total;
    
    int totalLoop = 5000;
    NSLog(@"**** start total = %zd, %@",
          self.total, [NSThread currentThread]);
    
    dispatch_queue_t global =
    dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    
    for (int i = 0; i < totalLoop; i++) {
        int whether = arc4random()%2;
        if (whether == 0) {
            
            dispatch_async(global, ^{
                [self increaseTotal];
            });
            self.testTotal++;
        } else {
            dispatch_async(global, ^{
                [self decreaseTotal];
            });
            self.testTotal--;
        }
    }
    dispatch_barrier_async(global, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"**** End");
            NSLog(@"total = %zd", self.total);
            NSLog(@"testTotal = %zd", self.testTotal);
            
            if (self.total != self.testTotal) {
                NSLog(@"스레드 세이프 하지 않음~~");
            }else {
                SEL rec = @selector(testThreadSafety);
                [self performSelectorOnMainThread:rec
                                       withObject:nil
                                    waitUntilDone:NO];
            }
        });
    });
}

- (void)increaseTotal {
    self.total += 1;
}
- (void)decreaseTotal {
    self.total -= 1;
}

///// 아토믹 오퍼레이션.. 스레드 세이프
//- (void)increaseTotal {
//    OSAtomicIncrement64(&_total);
//}
//- (void)decreaseTotal {
//    OSAtomicDecrement64(&_total);
//}

////// 스레드 세이프
//- (void)increaseTotal {
//    [self.lock lock];
//    self.total++;
//    [self.lock unlock];
//}
//- (void)decreaseTotal {
//    [self.lock lock];
//    self.total--;
//    [self.lock unlock];
//}

// Not Thread Safe
//- (void)increaseTotal {
//    NSLock *customLock = [NSLock new];
//    [customLock lock];
//    self.total++;
//    [customLock unlock];
//}
//- (void)decreaseTotal {
//    NSLock *customLock = [NSLock new];
//    [customLock lock];
//    self.total--;
//    [customLock unlock];
//}

// 오... 스레드 세이프 하지 않은 순간이 나옴!!!!!!!!
// 아니네.. 이것도 스레드 세이프 한듯!
//- (void)increaseTotal {
//    @synchronized (self.lock) {
//        self.total++;
//    }
//}
//- (void)decreaseTotal {
//    @synchronized (self.lock) {
//        self.total--;
//    }
//}

#pragma mark Dead Lock

#pragma mark Live Lock

#pragma mark Recursive Lock

- (void)recursiveMethod1:(NSInteger)value {
    NSLog(@"##1 recursiveMethod1 = %zd, %@"
          , value, [NSThread currentThread]);
    [self.recursiveLock lock];
    NSLog(@"##1 [%zd] do somethings", value);
    if (value != 0) {
        [self recursiveMethod1:value-1];
    }
    NSLog(@"##1 [%zd] finish", value);
    [self.recursiveLock unlock];
}
- (void)recursiveMethod2:(NSInteger)value {
    NSLog(@"##2 recursiveMethod2 = %zd, %@"
          , value, [NSThread currentThread]);
    [self.recursiveLock lock];
    NSLog(@"##2 [%zd] do somethings", value);
    if (value != 0) {
        [self recursiveMethod2:value-1];
    }
    NSLog(@"##2 [%zd] finish", value);
    [self.recursiveLock unlock];
}

- (void)checkTotal {
    NSLog(@"**** End total = %zd, testTotal = %zd", self.total, self.testTotal);
}

#pragma mark NSConditionLock

- (void)producer {
    BOOL keepProduce = YES;
    while (keepProduce) {
        [self.conditionLock lockWhenCondition:10];
        int whether = arc4random()%2;
        NSLog(@"## producer time = %@", whether==0?@"String":@"Number");
        if (whether == 0) { // String
            [self.dataArray addObject:@"Hello!"];
        } else { // Number
            [self.dataArray addObject:@(111)];
        }
        if (self.dataArray.count == 5) keepProduce = NO;
        [self.conditionLock unlockWithCondition:(whether==0?9:99)];
    }
}
static BOOL keepConsume = YES;
- (void)consumer1 {
    while (keepConsume) {
        NSDate *secondLater = [NSDate dateWithTimeIntervalSinceNow:1];
        BOOL acquiring =
        [self.conditionLock lockWhenCondition:9
                                   beforeDate:secondLater];
        if (acquiring) {
            NSLog(@"# consumer1 time");
            NSString *helloString = [self.dataArray lastObject];
            NSLog(@"# consume1 String = %@", helloString);
            if (self.dataArray.count == 5) keepConsume = NO;
            [self.conditionLock unlockWithCondition:10];
        }
    }
}
- (void)consumer2 {
    while (keepConsume) {
        NSDate *secondLater = [NSDate dateWithTimeIntervalSinceNow:1];
        BOOL acquiring =
        [self.conditionLock lockWhenCondition:99
                                   beforeDate:secondLater];
        if (acquiring) {
            NSLog(@"# consumer2 time");
            NSNumber *number = [self.dataArray lastObject];
            NSLog(@"# consume2 Number = %@", number);
            if (self.dataArray.count == 5) keepConsume = NO;
            [self.conditionLock unlockWithCondition:10];
        }
    }
}


#pragma mark Non
- (void)methodInThread1:(NSNumber *)isLast {
    NSLog(@"#1 start, %@", [NSThread currentThread]);
    
    _total = _total+1;
    NSLog(@"#1 mid, %@", [NSThread currentThread]);
    
    NSLog(@"#1 end, %@", [NSThread currentThread]);
}
- (void)methodInThread2:(NSNumber *)isLast {
    NSLog(@"#2 start, %@", [NSThread currentThread]);
    _total = _total-1;
    NSLog(@"#2 mid, %@", [NSThread currentThread]);
    
    NSLog(@"#2 end, %@", [NSThread currentThread]);
}


#pragma mark NSLock
//- (void)methodInThread1:(NSNumber *)isLast {
//    NSLog(@"#1 start, %@", [NSThread currentThread]);
//    NSLock *lock = [NSLock new];
//    if ([lock tryLock]) {
//        self.total++;
//        NSLog(@"#1 mid, %@", [NSThread currentThread]);
//        [lock unlock];
//    }
//    NSLog(@"#1 end, %@", [NSThread currentThread]);
//}
//- (void)methodInThread2:(NSNumber *)isLast {
//    NSLog(@"#2 start, %@", [NSThread currentThread]);
//    NSLock *lock = [NSLock new];
//    if ([lock tryLock]) {
//        self.total--;
//        NSLog(@"#2 mid, %@", [NSThread currentThread]);
//        [lock unlock];
//    }
//    NSLog(@"#2 end, %@", [NSThread currentThread]);
//}

#pragma mark @synchronized
//- (void)methodInThread1:(NSNumber *)isLast {
//    NSLog(@"#1 start, %@", [NSThread currentThread]);
//    @synchronized (self) {
//        NSLog(@"#1 mid, %@", [NSThread currentThread]);
//        self.total++;
//    }
//    NSLog(@"#1 end, %@", [NSThread currentThread]);
//}
//- (void)methodInThread2:(NSNumber *)isLast {
//    NSLog(@"#2 start, %@", [NSThread currentThread]);
//    @synchronized (self) {
//        NSLog(@"#2 mid, %@", [NSThread currentThread]);
//        self.total--;
//    }
//    NSLog(@"#2 end, %@", [NSThread currentThread]);
//}


@end
