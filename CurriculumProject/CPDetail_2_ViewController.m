//
//  CPDetail_2_ViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 6. 29..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPDetail_2_ViewController.h"

@interface CPDetail_2_ViewController ()

@end

@implementation CPDetail_2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)closeButtonHandler:(UIButton *)sender {
    self.interactive = NO;
}

- (IBAction)show_detail1_Handler:(UIButton *)sender {
    
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"segue_id_비교"]) {
//        return NO;
//    }
//    return YES;
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    segue.sourceViewController;
//    segue.destinationViewController;
//}

@end
