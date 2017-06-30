//
//  CPSplitViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPSplitViewController.h"

#import "CPDetail_2_ViewController.h"

@interface CPSplitViewController ()

@end

@implementation CPSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    NSLog(@"willTransitionToTraitCollection = %@", newCollection);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSLog(@"viewWillTransitionToSize = %@", NSStringFromCGSize(size));
    NSLog(@"self.traitCollection = %@", self.traitCollection);
//    UITraitCollection *collection = self.traitCollection;
//    collection.horizontalSizeClass == UIUserInterfaceSize
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"traitCollectionDidChange");
    NSLog(@"before = %@", previousTraitCollection);
    NSLog(@"after = %@", self.traitCollection);
}

- (void)selectIndex:(NSInteger)index {
    CPDetail_2_ViewController *controller = (CPDetail_2_ViewController *)
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPDetail_2_ViewController"];
//    UIUserInterfaceIdiomPhone
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
//    if (index == 0) {
//        [self showViewController:controller sender:self];
//    }else if (index == 1) {
//        [self showDetailViewController:controller sender:self];
//    }
}
@end
