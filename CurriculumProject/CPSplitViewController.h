//
//  CPSplitViewController.h
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

// definesPresentationContext 와 Custom Transition Delegate 예제입니다.
// Storyboard 에서 InitialViewController를 수정해서 테스트 가능합니다.
@interface CPSplitViewController : UISplitViewController

- (void)selectIndex:(NSInteger)index;

@end
