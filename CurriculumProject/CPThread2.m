//
//  CPThread2.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 6. 7..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPThread2.h"

@implementation CPThread2

- (void)main {
//    @autoreleasepool {
        NSLog(@"CPThread2 start, %@", [NSThread currentThread]);
        
        for (int i = 0; i < 5; i++) {
            NSLog(@"[%zd] for", i);
            
            for (int k = 0; k < 10000; k++) {
                int twentyMb = 2000; // 2KB
                NSMutableData *theData1 = [[NSMutableData alloc] initWithCapacity:twentyMb];
                [NSMutableData dataWithCapacity:twentyMb];
                //            NSLog(@"1");
                for( unsigned int j = 0 ; j < twentyMb/4 ; j++ )
                {
                    u_int32_t randomBits = arc4random();
                    [theData1 appendBytes:(void*)&randomBits length:4];
                }
                if (k == 0) {
                    NSLog(@"0 data size = %.2f KB", (double)(theData1.length/(1024.0f)));
                }else if (k == 9999) {
                    NSLog(@"9999 data size = %.2f KB", (double)(theData1.length/(1024.0f)));
                }
                //                UIImage *image = [UIImage imageNamed:@"kitten.jpg"];
                //                image = image;
            }
            NSLog(@"[%zd] end", i);
        }
        NSLog(@"CPThread2 end, %@", [NSThread currentThread]);
    
//    char *buffer = malloc(1024*1024*20);
//    NSLog(@"buffer = %", buffer);
//    }
}
@end
