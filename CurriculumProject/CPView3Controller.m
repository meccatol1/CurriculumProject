//
//  CPView3Controller.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView3Controller.h"

#import "CPThread.h"

#include <assert.h>
#include <pthread.h>

@interface CPView3Controller ()

@end

@implementation CPView3Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark - Thread
    
#pragma mark Creating Threads
//    [self cocoaThread];
    [NSThread detachNewThreadSelector:@selector(customMethod) toTarget:self withObject:nil];
//    [self customMethod];
//    CPThread *thread = [[CPThread alloc] init];
//    [thread start];

#pragma mark Creating POSIX Thread
//    [self posixThread];
}

//    [NSThread detachNewThreadSelector:@selector(customMethod) toTarget:self withObject:nil];
//    [self performSelectorInBackground:@selector(customMethod) withObject:nil];

- (void)cocoaThread {
    NSLog(@"## Creating");
    CPThread *thread = [[CPThread alloc] init];
    [thread setThreadPriority:.8];
    // defalut value 0.5
    [thread start];
    NSLog(@"## end");
}

- (void)customMethod {
    NSLog(@"customMethod start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 5; i++) {
        NSLog(@"[%zd] for", i);
        for (int k = 0; k < 10000; k++) {
            UIImage *image = [UIImage imageNamed:@"kitten.jpg"];
        }
        NSLog(@"[%zd] end", i);
    }
    NSLog(@"customMethod end, %@", [NSThread currentThread]);
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
