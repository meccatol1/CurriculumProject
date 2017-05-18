//
//  Human+Mouth.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "Human+Mouth.h"

#import <objc/runtime.h>

//@interface UIImage()
//- (void)hi;
//@end
//
//@implementation UIImage
//- (void)hi {
//    NSLog(@"hi");
//}
//@end

@interface Human()
@property NSString *gender;
@end


@implementation Human(Mouth)
@dynamic country;

static char const *Key = "country";
- (void)speak {
    NSLog(@"my name is %@", self.name);
    NSLog(@"my country is %@", self.country);
}
- (void)setCountry:(NSString *)country
{
    objc_setAssociatedObject(self,
                             Key,
                             country,
                             OBJC_ASSOCIATION_RETAIN);
}
- (NSString *)country
{
    return (NSString *)objc_getAssociatedObject(self, Key);
}
@end
