//
//  AHTag.h
//  AutomaticHeightTagTableViewCell
//
//  Created by WEI-JEN TU on 2016-07-16.
//  Copyright © 2016 Cold Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHTag : NSObject

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSNumber *selected;

@end

@interface NSDictionary (Extensions)

- (AHTag *)tag;

@end

@interface NSString (Extensions)

- (UIColor *)color;

@end
