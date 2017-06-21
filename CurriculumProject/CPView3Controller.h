//
//  CPView3Controller.h
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 4..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TestProtocol <NSObject>
- (void)a;
- (void)b;
@optional
- (void)c;
@end

@interface CPView3Controller : UIViewController<TestProtocol>

@end
