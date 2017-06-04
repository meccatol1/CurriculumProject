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
    NSLog(@"main start, %@", [NSThread currentThread]);
    for (int i = 0; i < 3; i++) {
        NSLog(@"i = %zd, %@", i, [NSThread currentThread]);
    }
    NSLog(@"main end, %@", [NSThread currentThread]);
}

- (void)threadMainRoutine
{
    BOOL moreWorkToDo = YES;
    BOOL exitNow = NO;
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    
    // Add the exitNow BOOL to the thread dictionary.
    NSMutableDictionary* threadDict = [[NSThread currentThread] threadDictionary];
    [threadDict setValue:[NSNumber numberWithBool:exitNow] forKey:@"ThreadShouldExitNow"];
    
    // Install an input source.
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

- (void)myInstallCustomInputSource {
    
}

@end
