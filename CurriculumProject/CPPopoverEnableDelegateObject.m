//
//  CPPopoverEnableDelegateObject.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 6. 29..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPPopoverEnableDelegateObject.h"

@implementation CPPopoverEnableDelegateObject

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    NSLog(@"adaptivePresentationStyleForPresentationController traitCollection = %@", traitCollection);
    return UIModalPresentationNone;
}
//
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    NSLog(@"adaptivePresentationStyleForPresentationController");
    return UIModalPresentationNone;
}

//
- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    NSLog(@"presentationController viewControllerForAdaptivePresentationStyle");
    return controller.presentingViewController;
}

@end
