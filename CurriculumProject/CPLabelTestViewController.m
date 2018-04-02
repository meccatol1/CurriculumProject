//
//  CPLabelTestViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 7. 11..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPLabelTestViewController.h"

@interface CPLabelTestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel1;

@end

@implementation CPLabelTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.testLabel1.layer.borderWidth = 1;
    self.testLabel1.layer.borderColor = UIColor.blackColor.CGColor;
    
    
}
- (IBAction)buttonHandler:(UIButton *)sender {
    
//    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
//    
//    NSArray *numberStringArray = @[@1234, @23, @591, @15];
//    
//    for (NSNumber *num in numberStringArray) {
////        NSAttributedString *attrStr = [NSAttributedString attributedStringWithAttachment:attachment];
//        [mutableString beginEditing];
//        [mutableString appendAttributedString:attrStr];
//        [mutableString endEditing];
//        [mutableString appendAttributedString:[CPLabelTestViewController attributedString:num.stringValue]];
//    }
//    
//    [self.testLabel1 setAttributedText:mutableString];
}

+ (NSAttributedString *)attributedString:(NSString *)string {
    NSMutableParagraphStyle *paragraphStyle =  [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.firstLineHeadIndent = 10.0f;
    paragraphStyle.headIndent = 10.0f;
    paragraphStyle.tailIndent = 10.0f;
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName  : paragraphStyle,
                                 NSFontAttributeName            : [UIFont boldSystemFontOfSize:14.0]
                                 };
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string
                                                                         attributes:attributes];
    return attributedText;
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

@end
