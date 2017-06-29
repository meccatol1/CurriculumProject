//
//  CPCustomContent_2_ViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 29..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPCustomContent_2_ViewController.h"

#import "CPCustomContent_3_ViewController.h"

@interface CPCustomContent_2_ViewController ()

@end

@implementation CPCustomContent_2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_Handler:(UIButton *)sender {
    CPCustomContent_3_ViewController *controller =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CPCustomContent_3_ViewController"];
    controller.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
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
