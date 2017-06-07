//
//  CPPortThread.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 7..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPPortThread.h"

@implementation CPPortThread

//// NSPortMessage 가 mac os만 지원해서..
//- (void)main {
//    @autoreleasepool {
//        NSPort* myPort = [NSMachPort port];
//        [myPort setDelegate:self];
//        [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
//        
//        // Create the check-in message.
//        NSPortMessage *messageObj =
//        [[NSPortMessage alloc] initWithSendPort:self.remotePort
//                                    receivePort:myPort components:nil];
//        
//        if (messageObj)
//        {
//            // Finish configuring the message and send it immediately.
//            [messageObj setMsgId:100];
//            [messageObj sendBeforeDate:[NSDate date]];
//        }
//        
//        BOOL shouldExit = NO;
//        do
//        {
//            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                     beforeDate:[NSDate distantFuture]];
//        }
//        while (!shouldExit);
//    }
//}
@end
//
//- (void)handlePortMessage:(NSPortMessage *)message {
//    unsigned int message = [portMessage msgid];
//    NSPort* distantPort = nil;
//    
//    if (message == 100)
//    {
//        // Get the worker thread’s communications port.
//        distantPort = [portMessage sendPort];
//        
//        // Retain and save the worker port for later use.
//        [self storeDistantPort:distantPort];
//    }
//    else
//    {
//        // Handle other messages.
//    }
//}
