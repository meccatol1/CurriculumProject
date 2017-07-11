//
//  AHTag.m
//  AutomaticHeightTagTableViewCell
//
//  Created by WEI-JEN TU on 2016-07-16.
//  Copyright © 2016 Cold Yam. All rights reserved.
//

#import "AHTag.h"

#define CATEGORY_KEY @"CATEGORY"
#define TITLE_KEY @"TITLE"
#define IMAGE_KEY @"IMAGE"
#define SELECTED_KEY @"SELECTED"
#define COLOR_KEY @"COLOR"
#define URL_KEY @"URL"


@implementation AHTag

@end

@implementation NSDictionary (Extensions)

- (AHTag *)tag {
    AHTag *tag = [AHTag new];
    
    [tag setTitle:self[TITLE_KEY]];
    [tag setImage:self[IMAGE_KEY]];
    [tag setSelected:self[SELECTED_KEY]];
    
    return tag;
}

@end

@implementation NSString (Extensions)

- (UIColor *)color {
    unsigned value = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&value];
    
    return [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 \
                           green:((float)((value & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((value & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

@end
