//
//  CPTestClass.m
//  CurriculumProject
//
//  Created by Hyungsung_Kim on 2017. 7. 26..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPTestClass.h"

@implementation CPTestClass

+ (void)initialize {
    NSLog(@"initialize");
    [[self appearance] setImagePadding:3.f];
}
+ (void)checker {
    NSLog(@"checker = %f", [[self appearance] imagePadding]);
}

@end
