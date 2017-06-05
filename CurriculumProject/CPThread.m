//
//  CPThread.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPThread.h"

@implementation CPThread

- (void)main {
    NSLog(@"CPThread main start, %@", [NSThread currentThread]);
    
    for (int i = 0; i < 10000; i++) {
//        @autoreleasepool {
        NSLog(@"[%zd] for", i);
        
        int twentyMb           = 20971520;
        NSMutableData *theData1 = [NSMutableData dataWithCapacity:twentyMb];
        for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
        {
            u_int32_t randomBits = arc4random();
            [theData1 appendBytes:(void*)&randomBits length:4];
        }
        NSMutableData *theData2 = [NSMutableData dataWithCapacity:twentyMb];
        for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
        {
            u_int32_t randomBits = arc4random();
            [theData2 appendBytes:(void*)&randomBits length:4];
        }
        
        NSLog(@"[%zd] data1 size = %.2f MB", i, (double)(theData1.length/(1024.0f*1024.0f)));
        NSLog(@"[%zd] data2 size = %.2f MB", i, (double)(theData2.length/(1024.0f*1024.0f)));
        //        }
    }
    NSLog(@"CPThread main end, %@", [NSThread currentThread]);
}

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
        
        [self myInstallCustomInputSource];
        
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

- (void)myInstallCustomInputSource {
    
}

@end
