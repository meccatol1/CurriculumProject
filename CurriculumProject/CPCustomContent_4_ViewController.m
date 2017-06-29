//
//  CPCustomContent_4_ViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 30..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPCustomContent_4_ViewController.h"

@interface CPCustomContent_4_ViewController ()

@end

@implementation CPCustomContent_4_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeButtonHandler:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc");
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
