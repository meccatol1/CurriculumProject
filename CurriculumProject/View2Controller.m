//
//  View2Controller.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 15..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "View2Controller.h"

@interface View2Controller ()

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.restorationClass = View2Controller.class;
    
//    self.restorationIdentifier // 중복방지라고는 없다
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    
    NSLog(@"presenting VC = %@", self.presentingViewController);
    NSLog(@"presented VC = %@", self.presentedViewController);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)presentButtonHandler:(UIButton *)sender {
    UIViewController *conroller = [self.storyboard instantiateViewControllerWithIdentifier:@"SubViewController"];
    [self presentViewController:conroller
                       animated:YES
                     completion:^{
                         NSLog(@"after present");
                         
                         NSLog(@"presenting VC = %@", self.presentingViewController);
                         NSLog(@"presented VC = %@", self.presentedViewController);
                     }];
}
- (IBAction)buttonHandler:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    NSLog(@"viewControllerWithRestorationIdentifierPath, %@", identifierComponents);
    View2Controller *controller = nil;
    //    [[[[[UIApplication sharedApplication] keyWindow] rootViewController] storyboard] instantiateViewControllerWithIdentifier:@"CPView2_2Controller"];
    //
    UIStoryboard *sb = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (sb) {
        controller = [sb instantiateViewControllerWithIdentifier:@"View2Controller"];
    }
    
    return controller;
}

@end
