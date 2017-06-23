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

#include <AdSupport/AdSupport.h>

#import <Photos/Photos.h>

#import "CPView4ViewController.h"

@interface CPView3Controller () <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (atomic) NSInteger total;
@property (atomic) NSInteger testTotal;

@property (strong) NSLock *lock;

@property (strong) NSRecursiveLock *recursiveLock;

@property (strong) NSConditionLock *conditionLock;
@property (strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSString *nString;
@property (atomic, strong) NSMutableString *mString;

@property (strong) NSLock *lock1;
@property (strong) NSLock *lock2;

@end

@implementation CPView3Controller

- (IBAction)buttonHandler:(id)sender {
    if (self.textView.isFirstResponder) {
        [self.textView resignFirstResponder];
    }
}
- (IBAction)button2Handler:(UIButton *)sender {
//    CPView4ViewController *controller =
//    [[CPView4ViewController alloc] initWithNibName:@"CPView4ViewController" bundle:nil];
//    
//    [self presentViewController:controller
//                       animated:YES
//                     completion:^{
//                         
//                     }];
    
    for (int i = 0; i < 5; i++) {
        [[NSNotificationQueue defaultQueue] enqueueNotification:[NSNotification notificationWithName:@"String" object:nil]
                                                   postingStyle:NSPostASAP
                                                   coalesceMask:NSNotificationCoalescingOnName
                                                       forModes:nil];
    }
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"String" object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"check Responder Chain");
    id nextChain = self.view;
    while (nextChain != nil) {
        NSLog(@"chain = %@", nextChain);
        nextChain = [nextChain nextResponder];
    }
//    NSPropertyListSerialization
//    UIImage
}

- (void)testtest:(id)notification {
    NSLog(@"testtest = %@", notification);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.layer.borderWidth = 1.f;
    self.textView.layer.borderColor = [UIColor colorWithWhite:0.05 alpha:1.f].CGColor;
    
//    NSLog(@"id for vender = %@", [[UIDevice currentDevice] identifierForVendor]);
#pragma mark - Synchronization
    
#pragma mark NSLock
//    self.lock = [[NSLock alloc] init];
    
//    [self testThreadSafety];
    
#pragma mark 번외, atomic!
    
    [[UIDevice currentDevice] identifierForVendor];
    
    [[ASIdentifierManager sharedManager] advertisingIdentifier];
    
    
    NSLog(@"id for vender = %@", [[UIDevice currentDevice] identifierForVendor]);
    NSLog(@"id adIdentifier %@", [[ASIdentifierManager sharedManager] advertisingIdentifier]);
    
    NSUserDefaults *userDefautls = [NSUserDefaults standardUserDefaults];
    id bookIsAllowed = [userDefautls objectForKey:@"com.apple.content-rating.ExplicitBooksAllowed"];
    
    NSLog(@"%@", bookIsAllowed);
    
//    [CPView3Controller instancesRespondToSelector:@selector(aa)];
    if ([self conformsToProtocol:@protocol(TestProtocol)]) {
        NSLog(@"따름");
        
        NSString *h1 = [NSString stringWithFormat:@"hello world %zd", 10];
        NSString *h2 = [NSString stringWithFormat:@"hello world %zd", 10];
        NSLog(@"h1 = %p, h2 = %p", h1, h2);
        NSLog(@"h1's hash = %lu, h2's hash = %lu", h1.hash, h2.hash);
    }else {
        NSLog(@"안따름");
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(testtest:)
                                                 name:@"String"
                                               object:nil];
//    NSNotificationQueue
//    NSUndoManager
//    NSInvocation
    
    //// 설명없이 사용하면 크래시!!
//    PHFetchResult *library = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum
//                                                                          subtype:PHAssetCollectionSubtypeAlbumMyPhotoStream
//                                                                          options:nil];
//    NSLog(@"library count = %zd", library.count);
    
//    self.mString = [NSMutableString stringWithString:@"test"];
//    
//    dispatch_queue_t queue = dispatch_queue_create("adsf", DISPATCH_QUEUE_CONCURRENT);
//    self.total = 10000;
//    for (int i = 0; i < self.total; i++) {
//        dispatch_async(queue, ^{
//            int whether = arc4random()%2;
//            if (whether == 0) {
//                [self.mString appendString:@"+"];
//            } else {
//                [self.mString appendString:@"-"];
//            }
//        });
//    }
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"stringValue = %@", self.mString);
//        NSLog(@"length = %zd", self.mString.length);
//    });
    
//    dispatch_queue_t queue = dispatch_queue_create("adsf", DISPATCH_QUEUE_CONCURRENT);
//    self.total = 10000;
//    for (int i = 0; i < self.total; i++) {
//        dispatch_async(queue, ^{
//            int whether = arc4random()%2;
//            if (whether == 0) {
//                NSMutableString *tmSt = [self.mString mutableCopy];
//                [tmSt appendString:@"+"];
//                self.mString = tmSt;
//            } else {
//                NSMutableString *tmSt = [self.mString mutableCopy];
//                [tmSt appendString:@"-"];
//                self.mString = tmSt;
//            }
//        });
//    }
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"stringValue = %@", self.mString);
//        NSLog(@"length = %zd", self.mString.length);
//    });
    
//    [self testThreadSafety];
    
    //// 움,,, 베리어 제대로 동작하네 또..

#pragma mark Deadlock and livelock
    
//    self.lock1 = [[NSLock alloc] init];
//    self.lock2 = [[NSLock alloc] init];
//    [self performSelectorInBackground:@selector(liveTask1) withObject:nil];
//    [self performSelectorInBackground:@selector(liveTask2) withObject:nil];
    
//    [self performSelectorInBackground:@selector(task1) withObject:nil];
//    [self performSelectorInBackground:@selector(task2) withObject:nil];
    
//    dispatch_queue_t queue = dispatch_queue_create("adsf", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"#1 lock!!, %@", [NSThread currentThread]);
//        [self.lock1 lock];
//        [NSThread sleepForTimeInterval:1];
//        
//        [self.lock2 lock];
//        // do somethings
//        [self.lock2 unlock];
//        [self.lock1 unlock];
//        NSLog(@"#1 end!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"#2 lock!!, %@", [NSThread currentThread]);
//        [self.lock2 lock];
//        [NSThread sleepForTimeInterval:1];
//        
//        [self.lock1 lock];
//        // do somethings
//        [self.lock1 unlock];
//        [self.lock2 unlock];
//        NSLog(@"#2 end!!, %@", [NSThread currentThread]);
//    });
    
#pragma mark NSRecursiveLock
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
    
#pragma mark NSConditionLock
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

static int testMax = 100;

- (void)testThreadSafety {
    self.total = self.testTotal = 1000;
    int totalLoop = 5000;
    
    if (testMax == 100)
    NSLog(@"**** start total = %zd, %@",
          self.total, [NSThread currentThread]);
    
    dispatch_queue_t global =
    dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < totalLoop; i++) {
        int whether = arc4random()%2;
        if (whether == 0) {
            dispatch_group_async(group, global, ^{
                [self increaseTotal];
            });
            self.testTotal++;
        } else {
            dispatch_group_async(group, global, ^{
                [self decreaseTotal];
            });
            self.testTotal--;
        }
    }
    dispatch_group_notify(group, global, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.total != self.testTotal) {
                NSLog(@"스레드 세이프 하지 않음 ㅜㅜ, %zd, %zd"
                      , self.total, self.testTotal);
            }else {
                if (testMax == 0) {
                    NSLog(@"스레드 세이프 테스트 끝!");
                }else {
                    testMax--;
                    SEL rec = @selector(testThreadSafety);
                    [self performSelectorOnMainThread:rec
                                           withObject:nil
                                        waitUntilDone:NO];
                }
            }
        });
    });
}

///////// barrirer는 이전의 비동기 큐들이 모드 끝날때까지 기다리지 않는것같다...
//    dispatch_barrier_async(global, ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"**** End, total = %zd, testTotal = %zd", self.total, self.testTotal);
//            
//            if (self.total != self.testTotal) {
//                NSLog(@"스레드 세이프 하지 않음~~ㅜㅜ");
//            }else {
//                SEL rec = @selector(testThreadSafety);
//                [self performSelectorOnMainThread:rec
//                                       withObject:nil
//                                    waitUntilDone:NO];
//                
////                if (testMax == 0) {
////                    NSLog(@"스레드 세이프~~!");
////                }else {
////                    testMax--;
////                    
////                    SEL rec = @selector(testThreadSafety);
////                    [self performSelectorOnMainThread:rec
////                                           withObject:nil
////                                        waitUntilDone:NO];
////                }
//            }
//        });
//    });

//// immutable 객체를 멀티스레드 환경에서 락 없이 사용하려고 한다면, double free? 관련 크래시 발생한다.
//- (void)increaseTotal {
//    self.total += 1;
////    [self.mString deleteCharactersInRange:NSMakeRange(0, self.mString.length-1)];
////    [self.mString appendString:@" increase"];
//}
//- (void)decreaseTotal {
//    self.total -= 1;
////    [self.mString appendString:@" decrease"];
//}


//- (void)increaseTotal {
//    self.total += 1;
//}
//- (void)decreaseTotal {
//    self.total -= 1;
//}

- (void)increaseTotal {
    self.total += 1;
}
- (void)decreaseTotal {
    self.total -= 1;
}

////// 아토믹 오퍼레이션.. 스레드 세이프

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

////// Not Thread Safe
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

////// 스레드 세이프!

//- (void)increaseTotal {
//    @synchronized (self) {
//        self.total++;
//    }
//}
//- (void)decreaseTotal {
//    @synchronized (self) {
//        self.total--;
//    }
//}

//- (void)increaseTotal:(id)token {
//    @synchronized (token) {
//        self.total++;
//        [self.mString appendString:@"+"];
//    }
//}
//- (void)decreaseTotal:(id)token {
//    @synchronized (token) {
//        self.total--;
//        [self.mString appendString:@"-"];
//    }
//}

#pragma mark Dead Lock

- (void)task1 {
    NSLog(@"#1 lock!!, %@", [NSThread currentThread]);
    [self.lock1 lock];
    [NSThread sleepForTimeInterval:1];
    
    [self.lock2 lock];
    // do somethings
    [self.lock2 unlock];
    [self.lock1 unlock];
    NSLog(@"#1 end!!, %@", [NSThread currentThread]);
}
- (void)task2 {
    NSLog(@"#2 lock!!, %@", [NSThread currentThread]);
    [self.lock2 lock];
    [NSThread sleepForTimeInterval:1];
    
    [self.lock1 lock];
    // do somethings
    [self.lock1 unlock];
    [self.lock2 unlock];
    NSLog(@"#2 end!!, %@", [NSThread currentThread]);
}

#pragma mark Live Lock

- (void)liveTask1 {
    NSLog(@"#1 lock!!, %@", [NSThread currentThread]);
    BOOL finished = NO;
    
    while (finished == NO) {
        [self.lock1 lock];
        [NSThread sleepForTimeInterval:1];
        if ([self.lock2 tryLock]) {
            // do sometings
            finished = YES;
            [self.lock2 unlock];
            [self.lock1 unlock];
        }else {
            NSLog(@"#1 again!!, %@", [NSThread currentThread]);
            [self.lock1 unlock];
        }
    }
    NSLog(@"#1 end!!, %@", [NSThread currentThread]);
}
- (void)liveTask2 {
    NSLog(@"#2 lock!!, %@", [NSThread currentThread]);
    BOOL finished = NO;
    
    while (finished == NO) {
        [self.lock2 lock];
        [NSThread sleepForTimeInterval:1];
        if ([self.lock1 tryLock]) {
            // do sometings
            finished = YES;
            [self.lock1 unlock];
            [self.lock2 unlock];
        }else {
            NSLog(@"#2 again!!, %@", [NSThread currentThread]);
            [self.lock2 unlock];
        }
    }
    NSLog(@"#2 end!!, %@", [NSThread currentThread]);
}

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
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
    
    return YES;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    NSLog(@"encodeRestorableStateWithCoder");
    [coder encodeObject:self.textView.text forKey:@"textView_text"];
}
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    NSLog(@"decodeRestorableStateWithCoder");
    self.textView.text = (NSString *)[coder decodeObjectForKey:@"textView_text"];
}

@end
