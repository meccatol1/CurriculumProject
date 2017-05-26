//
//  ForwardingObject.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 26..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "ForwardingObject.h"

@implementation ForwardingObject
- (void)printThisString:(NSString *)__string {
    NSLog(@"%@, %p", __string, __string);
}
@end



