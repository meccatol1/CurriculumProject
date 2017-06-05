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
    NSLog(@"## Creating");
    [NSThread detachNewThreadSelector:@selector(customMethod) toTarget:self withObject:nil];
    
    CPThread *thread = [[CPThread alloc] init];
    [thread start];
    
    [self performSelectorInBackground:@selector(customMethod) withObject:nil];
    NSLog(@"## end");
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSLog(@"## Creating");
//    LaunchThread();
//    NSLog(@"## end");
//}

- (void)customMethod {
    NSLog(@"customMethod start, %@", [NSThread currentThread]);
    for (int i = 0; i < 3; i++) {
        NSLog(@"i = %zd, %@", i, [NSThread currentThread]);
    }
    NSLog(@"customMethod end, %@", [NSThread currentThread]);
}

void *PosixThreadMainRoutine(void* data)
{
    NSLog(@"Posix start, %@", [NSThread currentThread]);
    for (int i = 0; i < 3; i++) {
        NSLog(@"i = %zd, %@", i, [NSThread currentThread]);
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
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
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
//    pthread_join(posixThreadID, NULL);
    NSLog(@"**** end LaunchThread");
}

@end
