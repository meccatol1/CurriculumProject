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

/**
 *  modalPresentationStyle and modalTransitionStyle 테스트가 있습니다.
 *  
 */

@interface CPView3Controller : UIViewController
///<TestProtocol>

@end
