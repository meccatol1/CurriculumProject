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
//            [messageObj setMsgId:setMsgid:kCheckinMessage];
//            [messageObj sendBeforeDate:[NSDate date]];
//        }
//        
//        
//        do
//        {
//            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                     beforeDate:[NSDate distantFuture]];
//        }
//        while (![workerObj shouldExit]);
//        
//        
//        [self setRemotePort:outPort];
//        // Create and configure the worker thread port.
//    }
//}


@end
