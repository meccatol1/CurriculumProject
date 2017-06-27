//
//  CPView2_2Controller.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 14..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView2_2Controller.h"

@interface CPView2_2Controller ()

@end

@implementation CPView2_2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
//    self.restorationClass = CPView2_2Controller.class;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    
    NSLog(@"presenting VC = %@", self.presentingViewController);
    NSLog(@"presented VC = %@", self.presentedViewController);
    
//    NSLog(@"check Responder Chain");
//    id nextChain = self.view;
//    while (nextChain != nil) {
//        NSLog(@"chain = %@", nextChain);
//        nextChain = [nextChain nextResponder];
//    }
    
//    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.view);
}

//- (BOOL)accessibilityPerformEscape {
//     return NO;
//}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    
    NSLog(@"willMoveToParentViewController = %@", parent);
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    
    NSLog(@"didMoveToParentViewController = %@", parent);
}

- (void)removeFromParentViewController {
    [super removeFromParentViewController];
    
    NSLog(@"removeFromParentViewController");
}
- (IBAction)view2_3ButtonHandler:(UIButton *)sender {
    UIViewController *controller =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPView2_3Controller"];
    
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self showViewController:controller sender:sender];
}
- (IBAction)backButtonHandler:(UIButton *)sender {
    NSLog(@"backButtonHandler");
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"completion");
                             }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                                                            coder:(NSCoder *)coder {
    NSLog(@"viewControllerWithRestorationIdentifierPath");
    
    UIStoryboard *sb =
    [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    CPView2_2Controller *controller =
    [sb instantiateViewControllerWithIdentifier:@"CPView2_2Controller"];
    
    return controller;
}


@end
