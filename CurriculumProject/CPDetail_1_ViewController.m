//
//  CPDetail_1_ViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPDetail_1_ViewController.h"

#import "CPDetail_2_ViewController.h"

@interface CPDetail_1_ViewController ()

@end

@implementation CPDetail_1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.modalTransitionStyle = UIModalPresentationCustom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backToPresentingVC:(UIStoryboardSegue*)unwindSegue {
    
}

- (IBAction)buttonHandler:(UIButton *)sender {
    CPDetail_2_ViewController *controller = (CPDetail_2_ViewController *)
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPDetail_2_ViewController"];
    
    controller.modalTransitionStyle = UIModalPresentationCustom;
    
    
    NSLog(@"startPresenting");
    
    
//    [self showViewController:controller sender:self];
//    [self showDetailViewController:controller sender:self];
    
    [self presentViewController:controller
                       animated:YES
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

@end
