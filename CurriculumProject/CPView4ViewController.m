//
//  CPView4ViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 6. 12..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView4ViewController.h"

@interface CPView4ViewController ()

@end

@implementation CPView4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view from its nib.
    
    self.restorationIdentifier = @"CPView4ViewController";
    // nib에서 할당한 restorationID가 먹히지 않고, 여기서 할당해줘야 인식함 // 왜?
    self.restorationClass = CPView4ViewController.class;
    // 또한 이 클래스를 할당해주지 않으면, appDelegate에 물어본다~
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
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
- (IBAction)backbuttonHandler:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                                                            coder:(NSCoder *)coder {
    NSLog(@"viewControllerWithRestorationIdentifierPath, %@", identifierComponents);
    
    CPView4ViewController *controller =
    [[CPView4ViewController alloc] initWithNibName:@"CPView4ViewController" bundle:nil];
    
    return controller;
}


- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    NSLog(@"encodeRestorableStateWithCoder");
//    [coder encodeObject:self.textView.text forKey:@"textView_text"];
}
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    NSLog(@"decodeRestorableStateWithCoder");
//    self.textView.text = (NSString *)[coder decodeObjectForKey:@"textView_text"];
}


@end
